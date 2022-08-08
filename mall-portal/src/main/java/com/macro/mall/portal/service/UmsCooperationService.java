package com.macro.mall.portal.service;

import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.portal.domain.vo.UmsCooperationParam;

import java.util.List;

public interface UmsCooperationService {

    /**
     * 创建合作申请
     *
     * @param umsCooperationParam
     * @return
     */
    public long create(UmsCooperationParam umsCooperationParam);

    /**
     * 通过邀请码查询合作申请
     *
     * @param memberId
     * @param inviteCode
     * @return
     */
    public List<UmsCooperationRequest> queryCooperations(Long memberId, String inviteCode);

}
