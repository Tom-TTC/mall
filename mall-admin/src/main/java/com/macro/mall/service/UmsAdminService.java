package com.macro.mall.service;

import com.macro.mall.domain.dto.UmsAdminParam;
import com.macro.mall.domain.dto.UpdateAdminPasswordParam;
import com.macro.mall.domain.vo.UmsAdminInfoRequest;
import com.macro.mall.domain.vo.UmsAdminInfoResponse;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsInviteRecord;
import com.macro.mall.model.UmsResource;
import com.macro.mall.model.UmsRole;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 后台用户管理Service
 * Created by macro on 2018/4/26.
 */
public interface UmsAdminService {
    /**
     * 根据用户名获取后台管理员
     */
    UmsAdmin getAdminByUsername(String username);

    /**
     * 注册功能
     */
    Long register(UmsAdminParam umsAdminParam);

    /**
     * 登录功能
     *
     * @param username 用户名
     * @param password 密码
     * @return 生成的JWT的token
     */
    String login(String username, String password);

    /**
     * 登出功能
     *
     * @param token
     * @return
     */
    String logout(String token);

    /**
     * 刷新token的功能
     *
     * @param oldToken 旧的token
     */
    String refreshToken(String oldToken);

    /**
     * 根据用户id获取用户
     */
    UmsAdmin getItem(Long id);

    /**
     * 根据用户名或昵称分页查询用户
     */
    List<UmsAdmin> list(String keyword, Integer pageSize, Integer pageNum);

    /**
     * 修改指定用户信息
     */
    int update(Long id, UmsAdmin admin);

    /**
     * 删除指定用户
     */
    int delete(Long id);

    /**
     * 修改用户角色关系
     */
    @Transactional
    int updateRole(Long adminId, List<Long> roleIds);

    /**
     * 获取用户对应角色
     */
    List<UmsRole> getRoleList(Long adminId);

    /**
     * 获取指定用户的可访问资源
     */
    List<UmsResource> getResourceList(Long adminId);

    /**
     * 修改密码
     */
    int updatePassword(UpdateAdminPasswordParam updatePasswordParam);

    /**
     * 获取用户信息
     */
    UserDetails loadUserByUsername(String username);

    /**
     * 获取用户业务信息
     *
     * @return
     */
    UmsAdminInfoResponse getAdminInfo(Long adminId);

    /**
     * 保存用户业务信息
     *
     * @param request
     */
    Long saveAdminInfo(UmsAdminInfoRequest request);

    /**
     * 更新团长业务信息
     *
     * @param request
     * @return
     */
    Long updateAdminInfo(UmsAdminInfoRequest request);

    /**
     * 更新团长积分
     * note:扣积分、增长积分
     *
     * @param request
     * @return
     */
    Long updateAdminRewardPoint(UmsAdminInfoRequest request);

    /**
     * 通过团长id获取邀请成功记录
     *
     * @param adminId
     * @return
     */
    List<UmsInviteRecord> getInviteRecord(Long adminId, int pageNum, int pageSize);
}
