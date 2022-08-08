package com.macro.mall.service;

public interface UmsAdminInfoService {

    /**
     * 增加积分
     * rewardPoint:要增加的积分
     */
    int incUserRewardPoint(Long adminId, Integer rewardPoint);

    /**
     * 扣减积分
     *
     * @param rewardPoint 要扣减的积分
     * @return
     */
    int decUserRewardPoint(Long adminId, Integer rewardPoint);

    /**
     * 统计积分足够的用户数量
     *
     * @param adminId   团长id
     * @param basePoint 一次扣减的积分数量
     * @return
     */
    long countUserWithEnoughPoint(Long adminId, Integer basePoint);

}
