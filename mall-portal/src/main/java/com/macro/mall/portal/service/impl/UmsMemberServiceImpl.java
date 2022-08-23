package com.macro.mall.portal.service.impl;

import cn.hutool.crypto.digest.DigestUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.utils.CommonUtils;
import com.macro.mall.mapper.UmsMemberLevelMapper;
import com.macro.mall.mapper.UmsMemberMapper;
import com.macro.mall.model.UmsMember;
import com.macro.mall.model.UmsMemberExample;
import com.macro.mall.model.UmsMemberLevel;
import com.macro.mall.model.UmsMemberLevelExample;
import com.macro.mall.portal.config.WechatConfig;
import com.macro.mall.portal.domain.MemberDetails;
import com.macro.mall.portal.domain.vo.*;
import com.macro.mall.portal.service.UmsMemberCacheService;
import com.macro.mall.portal.service.UmsMemberService;
import com.macro.mall.security.util.JwtTokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Random;

/**
 * 会员管理Service实现类
 * Created by macro on 2018/8/3.
 */
@Service
@Slf4j
public class UmsMemberServiceImpl implements UmsMemberService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UmsMemberServiceImpl.class);
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private UmsMemberMapper memberMapper;
    @Autowired
    private UmsMemberLevelMapper memberLevelMapper;
    @Autowired
    private UmsMemberCacheService memberCacheService;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Autowired
    private WechatConfig wechatConfig;

    @Override
    public UmsMember getByUsername(String username) {
        UmsMember member = memberCacheService.getMember(username);
        if (member != null) return member;
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(memberList)) {
            member = memberList.get(0);
            memberCacheService.setMember(member);
            return member;
        }
        return null;
    }

    @Override
    public UmsMember getById(Long id) {
        return memberMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public void register(String username, String password, String telephone, String authCode) {
        //验证验证码
        if (!verifyAuthCode(authCode, telephone)) {
            Asserts.fail("验证码错误");
        }
        //查询是否已有该用户
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        example.or(example.createCriteria().andPhoneEqualTo(telephone));
        List<UmsMember> umsMembers = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(umsMembers)) {
            Asserts.fail("该用户已经存在");
        }
        //没有该用户进行添加操作
        UmsMember umsMember = new UmsMember();
        umsMember.setUsername(username);
        umsMember.setPhone(telephone);
        umsMember.setPassword(passwordEncoder.encode(password));
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        //获取默认会员等级并设置
        UmsMemberLevelExample levelExample = new UmsMemberLevelExample();
        levelExample.createCriteria().andDefaultStatusEqualTo(1);
        List<UmsMemberLevel> memberLevelList = memberLevelMapper.selectByExample(levelExample);
        if (!CollectionUtils.isEmpty(memberLevelList)) {
            umsMember.setMemberLevelId(memberLevelList.get(0).getId());
        }
        memberMapper.insert(umsMember);
        umsMember.setPassword(null);
    }

    @Override
    public String generateAuthCode(String telephone) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            sb.append(random.nextInt(10));
        }
        memberCacheService.setAuthCode(telephone, sb.toString());
        return sb.toString();
    }

    @Override
    @Transactional
    public void updatePassword(UmsMemberPasswordRequest passwordRequest) {
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andPhoneEqualTo(passwordRequest.getTelephone());
        List<UmsMember> memberList = memberMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(memberList)) {
            Asserts.fail("该账号不存在");
        }
        //验证验证码
        if (!verifyAuthCode(passwordRequest.getAuthCode(), passwordRequest.getTelephone())) {
            Asserts.fail("验证码错误");
        }
        UmsMember umsMember = memberList.get(0);
        umsMember.setPassword(passwordEncoder.encode(passwordRequest.getPassword()));
        memberMapper.updateByPrimaryKeySelective(umsMember);
        memberCacheService.delMember(umsMember.getId());
    }

    @Override
    @Transactional
    public void updateHeadIcon(UmsMember member, UmsMemberHeadRequest headRequest) {
        UmsMember umsMember = new UmsMember().
                setId(member.getId())
                .setIcon(headRequest.getHeadIconUrl());
        memberMapper.updateByPrimaryKeySelective(umsMember);
    }

    @Override
    public void updatePhone(UmsMember member, UmsMemberPhoneRequest phoneRequest) {
        UmsMember umsMember = new UmsMember().
                setId(member.getId())
                .setPhone(phoneRequest.getPhone());
        memberMapper.updateByPrimaryKeySelective(umsMember);
    }

    @Override
    public UmsMemberInfo getMemberInfo(UmsMember umsMember) {
        UmsMember member = memberMapper.selectByPrimaryKey(umsMember.getId());
        return new UmsMemberInfo(member);
    }

    @Override
    public UmsMember getCurrentMember() {
        SecurityContext ctx = SecurityContextHolder.getContext();
        Authentication auth = ctx.getAuthentication();
        MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
        return memberDetails.getUmsMember();
    }

    @Override
    public Long getCurrentMemberId() {
        return getCurrentMember().getId();
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        UmsMember member = getByUsername(username);
        if (member != null) {
            return new MemberDetails(member);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }

    @Override
    public String login(String username, String password) {
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                throw new BadCredentialsException("密码不正确");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
        } catch (AuthenticationException e) {
            LOGGER.warn("登录异常:{}", e.getMessage());
        }
        return token;
    }

    @Override
    public WechatToken login(WechatLoginParam loginParam) {
        //1.请求微信，获取openid
        String url = wechatConfig.getUrl() + "?appid=" + wechatConfig.getAppId() +
                "&secret=" + wechatConfig.getAppSecret() + "&js_code=" + loginParam.getCode() + "&grant_type=authorization_code";

        RestTemplate restTemplate = new RestTemplate();
        //进行网络请求,访问url接口
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.GET, null, String.class);
        //根据返回值进行后续操作
        WechatSession wechatSession = null;
        if (responseEntity != null && responseEntity.getStatusCode() == HttpStatus.OK) {
            String sessionData = responseEntity.getBody();
            log.info("请求微信返回参数：{}", sessionData);
            ObjectMapper objectMapper = new ObjectMapper();
            //解析从微信服务器获得的openid和session_key;
            try {
                wechatSession = objectMapper.readValue(sessionData, WechatSession.class);
            } catch (JsonProcessingException e) {
                log.info("请求参数格式不匹配：{}", e);
                Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
            }

            if (StringUtils.isEmpty(wechatSession.getOpenid()) || StringUtils.isEmpty(wechatSession.getSession_key())) {
                log.info("openi或session_key为空");
                Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
            }
        } else {
            log.info("微信登录请求报错：{}", responseEntity);
            Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
        }


        //2.校验sign
        if (!StringUtils.isEmpty(loginParam.getSignature()) && !StringUtils.isEmpty(loginParam.getRawData())) {
            String sign = DigestUtil.sha1Hex(loginParam.getRawData() + wechatSession.getSession_key());
            if (!sign.equals(loginParam.getSignature())) {
                log.info("签名校验错误，传过来的sign:{}，自行计算的sign:{}", loginParam.getSignature(), sign);
                Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
            }
        }

        //3.判断openid是否存在（对应member中的username）
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria()
                .andUsernameEqualTo(wechatSession.getOpenid());
        List<UmsMember> members = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(members)) {
            //3.1如果存在，则判断是否禁用，禁用直接返回不可登录
            UmsMember member = members.get(0);
            if (Objects.equals(0, member.getStatus())) {
                log.info("用户已禁用，不可登录，username:{}，status:{}", member.getUsername(), member.getStatus());
                Asserts.fail(CommonConstant.WECHAT_USER_FORBIDDEN_ERROR);
            }
        } else {
            //3.2如果不存在，则先注册，使用openid为username进行注册
            registerForWechat(wechatSession.getOpenid());
        }

        //3.3 调登录，返回token
        String token = loginForWechat(wechatSession.getOpenid());
        if (StringUtils.isEmpty(token)) {
            log.info("获取token失败");
            Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
        }

        return new WechatToken(token, tokenHead, wechatSession.getOpenid(),wechatSession.getSession_key());
    }

    @Transactional
    public void registerForWechat(String username) {
        //查询是否已有该用户
        UmsMemberExample example = new UmsMemberExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsMember> umsMembers = memberMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(umsMembers)) {
            //Asserts.fail("该用户已经存在");
            log.info("该用户已经存在：{}", username);
            return;
        }
        String password = CommonUtils.generateMixString(6);
        log.info("un:{},p:{}", username, password);
        //没有该用户进行添加操作
        UmsMember umsMember = new UmsMember();
        umsMember.setUsername(username);
        umsMember.setPassword(passwordEncoder.encode(password));
        umsMember.setCreateTime(new Date());
        umsMember.setStatus(1);
        //获取默认会员等级并设置
        UmsMemberLevelExample levelExample = new UmsMemberLevelExample();
        levelExample.createCriteria().andDefaultStatusEqualTo(1);
        List<UmsMemberLevel> memberLevelList = memberLevelMapper.selectByExample(levelExample);
        if (!CollectionUtils.isEmpty(memberLevelList)) {
            umsMember.setMemberLevelId(memberLevelList.get(0).getId());
        }
        memberMapper.insert(umsMember);
        umsMember.setPassword(null);
    }

    /**
     * 微信登录
     *
     * @param username
     * @return
     */
    public String loginForWechat(String username) {
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
        } catch (AuthenticationException e) {
            LOGGER.warn("登录异常:{}", e.getMessage());
            Asserts.fail(CommonConstant.WECHAT_LOGIN_ERROR);
        }
        return token;
    }

    @Override
    public String refreshToken(String token) {
        return jwtTokenUtil.refreshHeadToken(token);
    }

    //对输入的验证码进行校验
    private boolean verifyAuthCode(String authCode, String telephone) {
        if (StringUtils.isEmpty(authCode)) {
            return false;
        }
        String realAuthCode = memberCacheService.getAuthCode(telephone);
        return authCode.equals(realAuthCode);
    }

}
