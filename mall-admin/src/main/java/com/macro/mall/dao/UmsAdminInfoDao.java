package com.macro.mall.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 后台角色管理自定义Dao
 * Created by macro on 2020/2/2.
 */
public interface UmsAdminInfoDao {
    /**
     * 增加积分
     * rewardPoint:要增加的积分
     */
    int incUserRewardPoint(@Param("adminId") Long adminId, @Param("changedRewardPoint") Integer rewardPoint);

    /**
     * 扣减积分
     *
     * @param rewardPoint 要扣减的积分
     * @return
     */
    int decUserRewardPoint(@Param("adminId") Long adminId, @Param("changedRewardPoint") Integer rewardPoint);

}
