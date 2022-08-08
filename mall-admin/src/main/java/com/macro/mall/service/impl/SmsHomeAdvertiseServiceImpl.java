package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.domain.vo.SmsHomeAdvertiseRequest;
import com.macro.mall.mapper.SmsHomeAdvertiseMapper;
import com.macro.mall.model.SmsHomeAdvertise;
import com.macro.mall.model.SmsHomeAdvertiseExample;
import com.macro.mall.service.SmsHomeAdvertiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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

    @Override
    @Transactional
    public Long create(SmsHomeAdvertiseRequest request) {
        SmsHomeAdvertise advertise = new SmsHomeAdvertise(
                request.getAdminId(),
                request.getName(),
                CommonConstant.ADVERTISEMENT_FOR_APP,
                request.getPic(),
                request.getStartTime(),
                request.getEndTime(),
                request.getUrl(),
                request.getNote(),
                request.getSort()
        );
        advertiseMapper.insert(advertise);
        return advertise.getId();
    }

    @Override
    @Transactional
    public int delete(List<Long> ids) {
        SmsHomeAdvertiseExample example = new SmsHomeAdvertiseExample();
        example.createCriteria().andIdIn(ids);
        return advertiseMapper.deleteByExample(example);
    }

    @Override
    @Transactional
    public int updateStatus(Long id, Integer status) {
        SmsHomeAdvertise record = new SmsHomeAdvertise();
        record.setId(id);
        record.setStatus(status);
        return advertiseMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public SmsHomeAdvertise getItem(Long id) {
        return advertiseMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int update(SmsHomeAdvertiseRequest request) {
        SmsHomeAdvertiseExample example = new SmsHomeAdvertiseExample();
        example.createCriteria()
                .andIdEqualTo(request.getId())
                .andAdminIdEqualTo(request.getAdminId());
        SmsHomeAdvertise advertise = new SmsHomeAdvertise(
                null,
                StringUtils.isEmpty(request.getName())?null:request.getName(),
                null,
                StringUtils.isEmpty(request.getPic())?null:request.getPic(),
                request.getStartTime(),
                request.getEndTime(),
                StringUtils.isEmpty(request.getUrl())?null:request.getUrl(),
                StringUtils.isEmpty(request.getNote())?null:request.getNote(),
                StringUtils.isEmpty(request.getSort())?null:request.getSort()
        );
        return advertiseMapper.updateByExampleSelective(advertise, example);
    }

    @Override
    public List<SmsHomeAdvertise> list(Long adminId, String name, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        SmsHomeAdvertiseExample example = new SmsHomeAdvertiseExample();
        SmsHomeAdvertiseExample.Criteria criteria = example.createCriteria();
        criteria.andAdminIdEqualTo(adminId);
        if (!StringUtils.isEmpty(name)) {
            criteria.andNameLike("%" + name + "%");
        }
        example.setOrderByClause("sort desc");
        return advertiseMapper.selectByExample(example);
    }
}
