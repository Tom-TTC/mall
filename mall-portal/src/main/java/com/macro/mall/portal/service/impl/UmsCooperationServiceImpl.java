package com.macro.mall.portal.service.impl;

import com.macro.mall.mapper.UmsCooperationRequestMapper;
import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.model.UmsCooperationRequestExample;
import com.macro.mall.portal.domain.vo.UmsCooperationParam;
import com.macro.mall.portal.service.UmsAdminService;
import com.macro.mall.portal.service.UmsCooperationService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class UmsCooperationServiceImpl implements UmsCooperationService {

    @Autowired
    private UmsAdminService adminService;
    @Autowired
    private UmsCooperationRequestMapper cooperationRequestMapper;

    /**
     * 创建合作申请
     *
     * @param param
     * @return
     */
    @Override
    @Transactional
    public long create(UmsCooperationParam param) {
        Long adminId = adminService.getAdminIdByInviteCode(param.getInviteCode());
        UmsCooperationRequest request = new UmsCooperationRequest(param.getName(),
                param.getPhone(),
                adminId,
                param.getMemberId(),
                param.getNote());
        cooperationRequestMapper.insert(request);
        return request.getId();
    }

    /**
     * 通过邀请码查询合作申请
     *
     * @param memberId
     * @param inviteCode
     * @return
     */
    @Override
    public List<UmsCooperationRequest> queryCooperations(Long memberId, String inviteCode) {
        Long adminId = adminService.getAdminIdByInviteCode(inviteCode);
        UmsCooperationRequestExample example = new UmsCooperationRequestExample();
        example.createCriteria()
                .andMemberIdEqualTo(memberId)
                .andAdminIdEqualTo(adminId);
        List<UmsCooperationRequest> result = cooperationRequestMapper.selectByExample(example);
        return result;
    }
}
