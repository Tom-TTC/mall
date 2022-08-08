package com.macro.mall.service;

import com.macro.mall.domain.vo.SmsHomeAdvertiseRequest;
import com.macro.mall.model.SmsHomeAdvertise;

import java.util.List;

/**
 * 首页广告管理Service
 * Created by macro on 2018/11/7.
 */
public interface SmsHomeAdvertiseService {
    /**
     * 添加广告
     */
    Long create(SmsHomeAdvertiseRequest advertise);

    /**
     * 批量删除广告
     */
    int delete(List<Long> ids);

    /**
     * 修改上、下线状态
     */
    int updateStatus(Long id, Integer status);

    /**
     * 获取广告详情
     */
    SmsHomeAdvertise getItem(Long id);

    /**
     * 更新广告
     */
    int update(SmsHomeAdvertiseRequest request);

    /**
     * 分页查询广告
     */
    List<SmsHomeAdvertise> list(Long adminId,String name, Integer pageSize, Integer pageNum);
}
