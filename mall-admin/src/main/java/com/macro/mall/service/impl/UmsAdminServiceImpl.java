package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.util.RequestUtil;
import com.macro.mall.common.utils.CommonUtils;
import com.macro.mall.common.utils.DateUtils;
import com.macro.mall.dao.UmsAdminInfoDao;
import com.macro.mall.dao.UmsAdminRoleRelationDao;
import com.macro.mall.domain.bo.AdminUserDetails;
import com.macro.mall.domain.dto.UmsAdminParam;
import com.macro.mall.domain.dto.UpdateAdminPasswordParam;
import com.macro.mall.domain.vo.UmsAdminInfoRequest;
import com.macro.mall.domain.vo.UmsAdminInfoResponse;
import com.macro.mall.mapper.UmsAdminInfoMapper;
import com.macro.mall.mapper.UmsAdminLoginLogMapper;
import com.macro.mall.mapper.UmsAdminMapper;
import com.macro.mall.mapper.UmsAdminRoleRelationMapper;
import com.macro.mall.model.*;
import com.macro.mall.security.util.JwtTokenUtil;
import com.macro.mall.service.UmsAdminCacheService;
import com.macro.mall.service.UmsAdminService;
import com.macro.mall.service.UmsInviteRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 后台用户管理Service实现类
 * Created by macro on 2018/4/26.
 */
@Service
public class UmsAdminServiceImpl implements UmsAdminService {
    private static final Logger LOGGER = LoggerFactory.getLogger(UmsAdminServiceImpl.class);
    @Autowired
    private JwtTokenUtil jwtTokenUtil;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UmsAdminMapper adminMapper;
    @Autowired
    private UmsAdminRoleRelationMapper adminRoleRelationMapper;
    @Autowired
    private UmsAdminRoleRelationDao adminRoleRelationDao;
    @Autowired
    private UmsAdminLoginLogMapper loginLogMapper;
    @Autowired
    private UmsAdminCacheService adminCacheService;

    @Autowired
    private UmsAdminInfoMapper adminInfoMapper;
    @Autowired
    private UmsAdminInfoDao adminInfoDao;

    @Autowired
    private UmsInviteRecordService inviteRecordService;

    @Value("${admin.reward-point-added}")
    private int rewardPointAdded;

    @Value("${admin.reward-point}")
    private int rewardPoint;

    @Override
    public UmsAdmin getAdminByUsername(String username) {
        UmsAdmin admin = adminCacheService.getAdmin(username);
        if (admin != null) return admin;
        UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<UmsAdmin> adminList = adminMapper.selectByExample(example);
        if (adminList != null && adminList.size() > 0) {
            admin = adminList.get(0);
            adminCacheService.setAdmin(admin);
            return admin;
        }
        return null;
    }

    @Transactional
    @Override
    public Long register(UmsAdminParam umsAdminParam) {
        //查询邀请码是否有效
        UmsAdminInfoExample adminInfoExample = new UmsAdminInfoExample();
        adminInfoExample.createCriteria()
                .andInviteCodeEqualTo(umsAdminParam.getInviteCode());
        List<UmsAdminInfo> adminInfos = adminInfoMapper.selectByExample(adminInfoExample);
        if (CollectionUtils.isEmpty(adminInfos)) {
            Asserts.fail(CommonConstant.INVITE_CODE_ERROR);
        }

        //校验手机号是否已经占用
        checkPhoneUsed(umsAdminParam.getPhone());

        //插入团长账号
        UmsAdmin umsAdmin = new UmsAdmin(umsAdminParam.getUsername(),
                umsAdminParam.getPassword(),
                umsAdminParam.getEmail());

        //查询是否有相同用户名的用户
        UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(umsAdmin.getUsername());
        List<UmsAdmin> umsAdminList = adminMapper.selectByExample(example);
        if (umsAdminList.size() > 0) {
            Asserts.fail(CommonConstant.USER_EXISTED);
        }
        //将密码进行加密操作
        String encodePassword = passwordEncoder.encode(umsAdmin.getPassword());
        umsAdmin.setPassword(encodePassword);
        adminMapper.insert(umsAdmin);

        //增加团长权限
        this.updateRole(umsAdmin.getId(), Lists.newArrayList(CommonConstant.ROLE_TUANZHANG));

        //增加adminInfo及积分初始化
        UmsAdminInfoRequest request = new UmsAdminInfoRequest()
                .setId(umsAdmin.getId())
                .setUsername(umsAdmin.getUsername())
                .setNickname(umsAdmin.getUsername())
                .setPhone(umsAdminParam.getPhone());
        this.saveAdminInfo(request);

        //增加邀请记录
        UmsInviteRecord inviteRecord = new UmsInviteRecord()
                .setUserId(adminInfos.get(0).getId())
                .setInviteCode(umsAdminParam.getInviteCode())
                .setUserIdInvited(umsAdmin.getId())
                .setUsernameInvited(umsAdmin.getUsername())
                .setCreateTime(DateUtils.getCurrentTime())
                .setRewardPoint(rewardPointAdded);
        inviteRecordService.addInviteRecord(inviteRecord);

        //增加邀请人的积分
        adminInfoDao.incUserRewardPoint(adminInfos.get(0).getId(), rewardPointAdded);
        /*UmsAdminInfoRequest rewardPointRequest = new UmsAdminInfoRequest()
                .setId(adminInfos.get(0).getId())
                .setRewardPoint(rewardPointAdded);
        updateAdminRewardPoint(rewardPointRequest);*/

        return umsAdmin.getId();
    }

    /**
     * 校验手机号是否已经占用
     *
     * @param phone
     */
    private void checkPhoneUsed(String phone) {
        UmsAdminInfoExample adminInfoExample = new UmsAdminInfoExample();
        adminInfoExample.createCriteria()
                .andPhoneEqualTo(phone);
        List<UmsAdminInfo> tempAdminInfos = adminInfoMapper.selectByExample(adminInfoExample);
        if (!CollectionUtils.isEmpty(tempAdminInfos)) {
            Asserts.fail(CommonConstant.PHONE_NUMBER_USED_ERROR);
        }
    }


    @Override
    public String login(String username, String password) {
        String token = null;
        //密码需要客户端加密后传递
        try {
            UserDetails userDetails = loadUserByUsername(username);
            if (!passwordEncoder.matches(password, userDetails.getPassword())) {
                Asserts.fail("密码不正确");
            }
            if (!userDetails.isEnabled()) {
                Asserts.fail("帐号已被禁用");
            }
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);
            token = jwtTokenUtil.generateToken(userDetails);
//            updateLoginTimeByUsername(username);
            insertLoginLog(username);
        } catch (AuthenticationException e) {
            LOGGER.warn("登录异常:{}", e.getMessage());
        }
        return token;
    }

    @Override
    public String logout(String token) {
        jwtTokenUtil.destroyToken(token);
        return null;
    }

    /**
     * 添加登录记录
     *
     * @param username 用户名
     */
    private void insertLoginLog(String username) {
        UmsAdmin admin = getAdminByUsername(username);
        if (admin == null) return;
        UmsAdminLoginLog loginLog = new UmsAdminLoginLog();
        loginLog.setAdminId(admin.getId());
        loginLog.setCreateTime(new Date());
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        loginLog.setIp(RequestUtil.getRequestIp(request));
        loginLogMapper.insert(loginLog);
    }

    /**
     * 根据用户名修改登录时间
     */
    private void updateLoginTimeByUsername(String username) {
        UmsAdmin record = new UmsAdmin();
        record.setLoginTime(DateUtils.getCurrentTime());
        UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(username);
        adminMapper.updateByExampleSelective(record, example);
    }

    @Override
    public String refreshToken(String oldToken) {
        return jwtTokenUtil.refreshHeadToken(oldToken);
    }

    @Override
    public UmsAdmin getItem(Long id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        UmsAdminExample example = new UmsAdminExample();
        UmsAdminExample.Criteria criteria = example.createCriteria();
        if (!StringUtils.isEmpty(keyword)) {
            criteria.andUsernameLike("%" + keyword + "%");
            example.or(example.createCriteria().andNickNameLike("%" + keyword + "%"));
        }
        return adminMapper.selectByExample(example);
    }

    @Override
    @Transactional
    public int update(Long id, UmsAdmin admin) {
        admin.setId(id);
        UmsAdmin rawAdmin = adminMapper.selectByPrimaryKey(id);
        if (rawAdmin.getPassword().equals(admin.getPassword())) {
            //与原加密密码相同的不需要修改
            admin.setPassword(null);
        } else {
            //与原加密密码不同的需要加密修改
            if (StrUtil.isEmpty(admin.getPassword())) {
                admin.setPassword(null);
            } else {
                admin.setPassword(passwordEncoder.encode(admin.getPassword()));
            }
        }
        int count = adminMapper.updateByPrimaryKeySelective(admin);
        adminCacheService.delAdmin(id);
        return count;
    }

    @Override
    @Transactional
    public int delete(Long id) {
        adminCacheService.delAdmin(id);
        int count = adminMapper.deleteByPrimaryKey(id);
        adminCacheService.delResourceList(id);
        return count;
    }

    @Override
    @Transactional
    public int updateRole(Long adminId, List<Long> roleIds) {
        int count = roleIds == null ? 0 : roleIds.size();
        //先删除原来的关系
        UmsAdminRoleRelationExample adminRoleRelationExample = new UmsAdminRoleRelationExample();
        adminRoleRelationExample.createCriteria().andAdminIdEqualTo(adminId);
        adminRoleRelationMapper.deleteByExample(adminRoleRelationExample);
        //建立新关系
        if (!CollectionUtils.isEmpty(roleIds)) {
            List<UmsAdminRoleRelation> list = new ArrayList<>();
            for (Long roleId : roleIds) {
                UmsAdminRoleRelation roleRelation = new UmsAdminRoleRelation();
                roleRelation.setAdminId(adminId);
                roleRelation.setRoleId(roleId);
                list.add(roleRelation);
            }
            adminRoleRelationDao.insertList(list);
        }
        adminCacheService.delResourceList(adminId);
        return count;
    }

    @Override
    public List<UmsRole> getRoleList(Long adminId) {
        return adminRoleRelationDao.getRoleList(adminId);
    }

    @Override
    public List<UmsResource> getResourceList(Long adminId) {
        List<UmsResource> resourceList = adminCacheService.getResourceList(adminId);
        if (CollUtil.isNotEmpty(resourceList)) {
            return resourceList;
        }
        resourceList = adminRoleRelationDao.getResourceList(adminId);
        if (CollUtil.isNotEmpty(resourceList)) {
            adminCacheService.setResourceList(adminId, resourceList);
        }
        return resourceList;
    }

    @Override
    @Transactional
    public int updatePassword(UpdateAdminPasswordParam param) {
        if (StrUtil.isEmpty(param.getUsername())
                || StrUtil.isEmpty(param.getOldPassword())
                || StrUtil.isEmpty(param.getNewPassword())) {
            return -1;
        }
        UmsAdminExample example = new UmsAdminExample();
        example.createCriteria().andUsernameEqualTo(param.getUsername());
        List<UmsAdmin> adminList = adminMapper.selectByExample(example);
        if (CollUtil.isEmpty(adminList)) {
            return -2;
        }
        UmsAdmin umsAdmin = adminList.get(0);
        if (!passwordEncoder.matches(param.getOldPassword(), umsAdmin.getPassword())) {
            return -3;
        }
        umsAdmin.setPassword(passwordEncoder.encode(param.getNewPassword()));
        adminMapper.updateByPrimaryKey(umsAdmin);
        adminCacheService.delAdmin(umsAdmin.getId());
        return 1;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        //获取用户信息
        UmsAdmin admin = getAdminByUsername(username);
        if (admin != null) {
            List<UmsResource> resourceList = getResourceList(admin.getId());
            return new AdminUserDetails(admin, resourceList);
        }
        throw new UsernameNotFoundException("用户名或密码错误");
    }

    @Override
    public UmsAdminInfoResponse getAdminInfo(Long adminId) {
        UmsAdminInfo adminInfo = adminInfoMapper.selectByPrimaryKey(adminId);
        return new UmsAdminInfoResponse(adminInfo);
    }

    @Override
    @Transactional
    public Long saveAdminInfo(UmsAdminInfoRequest request) {
        String inviteCode = null;
        UmsAdminInfoExample adminInfoExample = null;
        long count;
        for (int i = 0; i < 3; i++) {
            inviteCode = CommonUtils.generateMixString(6);
            adminInfoExample = new UmsAdminInfoExample();
            adminInfoExample.createCriteria()
                    .andInviteCodeEqualTo(inviteCode);
            count = adminInfoMapper.countByExample(adminInfoExample);
            if (count == 0) {
                break;
            }
        }
        if (inviteCode == null) {
            Asserts.fail(CommonConstant.INVITE_CODE_FAILED);
        }
        UmsAdminInfo adminInfo = new UmsAdminInfo(request.getId(),
                inviteCode,
                rewardPoint,
                request.getIntro(),
                request.getUsername(),
                request.getPhone(),
                request.getSkilledDomain(),
                request.getHeadIcon(),
                request.getNickname());
        adminInfoMapper.insert(adminInfo);
        return adminInfo.getId();
    }

    @Override
    @Transactional
    public Long updateAdminInfo(UmsAdminInfoRequest request) {
        //手机号校验
        if (!StringUtils.isEmpty(request.getPhone())) {
            checkPhoneUsed(request.getPhone());
        }

        //更新信息
        UmsAdminInfo adminInfo = new UmsAdminInfo(request.getId(),
                StringUtils.isEmpty(request.getIntro()) ? null : request.getIntro(),
                StringUtils.isEmpty(request.getPhone()) ? null : request.getPhone(),
                StringUtils.isEmpty(request.getSkilledDomain()) ? null : request.getSkilledDomain(),
                StringUtils.isEmpty(request.getHeadIcon()) ? null : request.getHeadIcon(),
                StringUtils.isEmpty(request.getNickname()) ? null : request.getNickname()
        );
        adminInfoMapper.updateByPrimaryKeySelective(adminInfo);
        return request.getId();
    }

    @Override
    @Transactional
    public Long updateAdminRewardPoint(UmsAdminInfoRequest request) {
        UmsAdminInfo adminInfo = new UmsAdminInfo()
                .setRewardPoint(request.getRewardPoint())
                .setId(request.getId());
        adminInfoMapper.updateByPrimaryKeySelective(adminInfo);
        return request.getId();
    }

    @Override
    public List<UmsInviteRecord> getInviteRecord(Long adminId, int pageNum, int pageSize) {
        List<UmsInviteRecord> result = inviteRecordService.listInviteRecords(adminId, pageNum, pageSize);
        return result;
    }
}
