package com.macro.mall.portal.service;

import com.macro.mall.model.UmsAdminInfo;
import com.macro.mall.portal.domain.vo.UmsAdminInfoResponse;

/**
 * 后台用户管理Service
 * Created by macro on 2018/4/26.
 */
public interface UmsAdminService {
    /**
     * 根据用户名获取后台管理员
     */
    UmsAdminInfo getAdminByInviteCode(String inviteCode);

    /**
     * 根据inviteCode获取id
     */
    Long getAdminIdByInviteCode(String inviteCode);

    /**
     * 查询团长信息
     *
     * @param adminId
     * @return
     */
    public UmsAdminInfoResponse getAdminInfo(String inviteCode);
}
