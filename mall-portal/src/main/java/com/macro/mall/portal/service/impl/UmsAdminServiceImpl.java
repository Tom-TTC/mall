package com.macro.mall.portal.service.impl;

import com.macro.mall.common.api.RedisTable;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.service.TTCRedisService;
import com.macro.mall.mapper.UmsAdminInfoMapper;
import com.macro.mall.model.UmsAdminInfo;
import com.macro.mall.model.UmsAdminInfoExample;
import com.macro.mall.portal.domain.vo.UmsAdminInfoResponse;
import com.macro.mall.portal.service.UmsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class UmsAdminServiceImpl implements UmsAdminService {

    @Autowired
    private TTCRedisService ttcRedisService;

    @Autowired
    private UmsAdminInfoMapper adminInfoMapper;

    /**
     * redis过期时间 3600秒
     */
    private static final long UMS_ADMIN_EXPIRE = 3600;

    /**
     * 根据用户名获取后台管理员
     *
     * @param inviteCode
     */
    @Override
    public UmsAdminInfo getAdminByInviteCode(String inviteCode) {
        UmsAdminInfo adminInfo = (UmsAdminInfo) ttcRedisService.get(RedisTable.UmsAdminInviteCode, inviteCode);
        if (adminInfo != null) {
            return adminInfo;
        }

        UmsAdminInfoExample example = new UmsAdminInfoExample();
        example.createCriteria()
                .andInviteCodeEqualTo(inviteCode);
        List<UmsAdminInfo> adminInfos = adminInfoMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(adminInfos)) {
            adminInfo = adminInfos.get(0);
            ttcRedisService.set(RedisTable.UmsAdminInviteCode, inviteCode, adminInfo, UMS_ADMIN_EXPIRE);
            return adminInfo;
        } else {
            Asserts.fail(CommonConstant.INVITE_CODE_ERROR);
            return null;
        }
    }

    /**
     * 根据inviteCode获取id
     * note:从缓存中取
     *
     * @param inviteCode
     */
    @Override
    public Long getAdminIdByInviteCode(String inviteCode) {
        UmsAdminInfo adminInfo = this.getAdminByInviteCode(inviteCode);
        return adminInfo.getId();
    }

    @Override
    public UmsAdminInfoResponse getAdminInfo(String inviteCode) {
        UmsAdminInfo adminInfo = getAdminByInviteCode(inviteCode);
        return new UmsAdminInfoResponse(adminInfo);
    }

    @Override
    public UmsAdminInfoResponse getAdminInfoByPhone(String phone) {
        UmsAdminInfoExample example = new UmsAdminInfoExample();
        example.createCriteria()
                .andPhoneEqualTo(phone);
        List<UmsAdminInfo> adminInfos = adminInfoMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(adminInfos)) {
            return new UmsAdminInfoResponse(adminInfos.get(0));
        } else {
            return null;
        }
    }
}
