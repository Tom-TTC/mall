package com.macro.mall.portal.service;

import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.domain.vo.*;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;

/**
 * 会员管理Service
 * Created by macro on 2018/8/3.
 */
public interface UmsMemberService {
    /**
     * 根据用户名获取会员
     */
    UmsMember getByUsername(String username);

    /**
     * 根据会员编号获取会员
     */
    UmsMember getById(Long id);

    /**
     * 用户注册
     */
    @Transactional
    void register(String username, String password, String telephone, String authCode);

    /**
     * 生成验证码
     */
    String generateAuthCode(String telephone);

    /**
     * 修改密码
     */
    @Transactional
    void updatePassword(UmsMemberPasswordRequest passwordRequest);

    /**
     * 更新头像
     */
    @Transactional
    void updateHeadIcon(UmsMember umsMember, UmsMemberHeadRequest headRequest);

    /**
     * 更新头像
     */
    @Transactional
    void updatePhone(UmsMember umsMember, UmsMemberPhoneRequest phoneRequest);

    /**
     * 获取当前登录的用户详情
     *
     * @return
     */
    UmsMemberInfo getMemberInfo(UmsMember umsMember);

    /**
     * 获取当前登录会员
     */
    UmsMember getCurrentMember();

    /**
     * 获取当前登录会员id
     *
     * @return
     */
    Long getCurrentMemberId();

    /**
     * 获取用户信息
     */
    UserDetails loadUserByUsername(String username);

    /**
     * 登录后获取token
     */
    String login(String username, String password);

    /**
     * 微信登录
     *
     * @param loginParam
     * @return
     */
    WechatToken login(WechatLoginParam loginParam);

    /**
     * 刷新token
     */
    String refreshToken(String token);
}
