package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.mapper.UmsCooperationRequestMapper;
import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.model.UmsCooperationRequestExample;
import com.macro.mall.service.UmsCooperationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
@Slf4j
public class UmsCooperationServiceImpl implements UmsCooperationService {

    @Autowired
    private UmsCooperationRequestMapper cooperationRequestMapper;


    /**
     * 通过邀请码查询合作申请
     *
     * @param adminId
     * @return
     */
    @Override
    public List<UmsCooperationRequest> queryCooperations(int pageNum, int pageSize, Long adminId) {
        PageHelper.startPage(pageNum, pageSize);
        UmsCooperationRequestExample example = new UmsCooperationRequestExample();
        example.createCriteria()
                .andAdminIdEqualTo(adminId);
        example.setOrderByClause("create_time desc");
        List<UmsCooperationRequest> result = cooperationRequestMapper.selectByExample(example);
        return result;
    }

    @Override
    public UmsCooperationRequest getCooperationById(Long coopId, Long adminId) {
        UmsCooperationRequestExample example = new UmsCooperationRequestExample();
        example.createCriteria()
                .andIdEqualTo(coopId)
                .andAdminIdEqualTo(adminId);
        List<UmsCooperationRequest> result = cooperationRequestMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(result)) {
            UmsCooperationRequest request = new UmsCooperationRequest()
                    .setId(coopId)
                    .setStatus((byte) 1);
            cooperationRequestMapper.updateByPrimaryKeySelective(request);
            return result.get(0);
        }
        return null;
    }
}
