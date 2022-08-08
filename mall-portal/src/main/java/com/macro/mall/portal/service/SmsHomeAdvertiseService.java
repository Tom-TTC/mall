package com.macro.mall.portal.service;

import com.macro.mall.model.SmsHomeAdvertise;

import java.util.List;

/**
 * 首页广告管理Service
 * Created by macro on 2018/11/7.
 */
public interface SmsHomeAdvertiseService {

    /**
     * 获取广告详情
     */
    SmsHomeAdvertise getItem(Long id);


    /**
     * 分页查询广告
     */
    List<SmsHomeAdvertise> list(String inviteCode,String name, Integer pageSize, Integer pageNum);
}
