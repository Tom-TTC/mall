package com.macro.mall.service;

import com.macro.mall.model.UmsCooperationRequest;

import java.util.List;

public interface UmsCooperationService {

    /**
     * 通过邀请码查询合作申请
     *
     * @param adminId
     * @return
     */
    public List<UmsCooperationRequest> queryCooperations(int pageNum, int pageSize, Long adminId);

    /**
     * 根据id查询合作
     *
     * @param coopId
     * @param adminId
     * @return
     */
    public UmsCooperationRequest getCooperationById(Long coopId, Long adminId);

}
