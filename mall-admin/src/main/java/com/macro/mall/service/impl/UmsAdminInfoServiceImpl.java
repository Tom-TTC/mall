package com.macro.mall.service.impl;

import com.macro.mall.dao.UmsAdminInfoDao;
import com.macro.mall.mapper.UmsAdminInfoMapper;
import com.macro.mall.model.UmsAdminInfoExample;
import com.macro.mall.service.UmsAdminInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
public class UmsAdminInfoServiceImpl implements UmsAdminInfoService {

    @Autowired
    private UmsAdminInfoDao adminInfoDao;

    @Autowired
    private UmsAdminInfoMapper adminInfoMapper;

    /**
     * 增加积分
     * rewardPoint:要增加的积分
     *
     * @param adminId
     * @param rewardPoint
     */
    @Override
    @Transactional
    public int incUserRewardPoint(Long adminId, Integer rewardPoint) {
        return adminInfoDao.incUserRewardPoint(adminId, rewardPoint);
    }

    /**
     * 扣减积分
     *
     * @param adminId
     * @param rewardPoint 要扣减的积分
     * @return
     */
    @Override
    @Transactional
    public int decUserRewardPoint(Long adminId, Integer rewardPoint) {
        return adminInfoDao.incUserRewardPoint(adminId, -rewardPoint);
    }

    /**
     * 统计积分足够的用户数量
     *
     * @param adminId   团长id
     * @param basePoint 一次扣减的积分数量
     * @return
     */
    @Override
    public long countUserWithEnoughPoint(Long adminId, Integer basePoint) {
        long begin = System.nanoTime();
        UmsAdminInfoExample example = new UmsAdminInfoExample();
        example.createCriteria()
                .andIdEqualTo(adminId)
                .andRewardPointGreaterThanOrEqualTo(basePoint);
        long count = adminInfoMapper.countByExample(example);
        log.info("count耗时：{}", System.nanoTime() - begin);
        return count;
    }
}
