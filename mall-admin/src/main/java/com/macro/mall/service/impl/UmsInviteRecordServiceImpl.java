package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.mapper.UmsInviteRecordMapper;
import com.macro.mall.model.UmsInviteRecord;
import com.macro.mall.model.UmsInviteRecordExample;
import com.macro.mall.service.UmsInviteRecordService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Slf4j
public class UmsInviteRecordServiceImpl implements UmsInviteRecordService {
    @Autowired
    private UmsInviteRecordMapper recordMapper;

    /**
     * 增加邀请记录
     *
     * @param inviteRecord
     * @return
     */
    @Override
    @Transactional
    public Long addInviteRecord(UmsInviteRecord inviteRecord) {
        recordMapper.insert(inviteRecord);
        return inviteRecord.getId();
    }

    @Override
    public List<UmsInviteRecord> listInviteRecords(Long adminId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        UmsInviteRecordExample example = new UmsInviteRecordExample();
        example.createCriteria()
                .andUserIdEqualTo(adminId);
        example.setOrderByClause("id desc");
        List<UmsInviteRecord> result = recordMapper.selectByExample(example);
        return result;
    }
}
