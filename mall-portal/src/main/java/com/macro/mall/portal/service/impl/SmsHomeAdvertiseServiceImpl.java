package com.macro.mall.portal.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.mapper.SmsHomeAdvertiseMapper;
import com.macro.mall.model.SmsHomeAdvertise;
import com.macro.mall.model.SmsHomeAdvertiseExample;
import com.macro.mall.portal.service.SmsHomeAdvertiseService;
import com.macro.mall.portal.service.UmsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 首页广告管理Service实现类
 * Created by macro on 2018/11/7.
 */
@Service
public class SmsHomeAdvertiseServiceImpl implements SmsHomeAdvertiseService {
    @Autowired
    private SmsHomeAdvertiseMapper advertiseMapper;

    @Autowired
    private UmsAdminService adminService;


    @Override
    public SmsHomeAdvertise getItem(Long id) {
        return advertiseMapper.selectByPrimaryKey(id);
    }


    /**
     * 只查询上线的广告（status:1）
     *
     * @param inviteCode
     * @param name
     * @param pageSize
     * @param pageNum
     * @return
     */
    @Override
    public List<SmsHomeAdvertise> list(String inviteCode, String name, Integer pageSize, Integer pageNum) {
        Long adminId = adminService.getAdminIdByInviteCode(inviteCode);
        PageHelper.startPage(pageNum, pageSize);
        SmsHomeAdvertiseExample example = new SmsHomeAdvertiseExample();
        SmsHomeAdvertiseExample.Criteria criteria = example.createCriteria();
        criteria.andAdminIdEqualTo(adminId)
                .andStatusEqualTo(1);
        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        example.setOrderByClause("sort desc");
        return advertiseMapper.selectByExample(example);
    }
}
