package com.macro.mall.service;

import com.macro.mall.model.UmsInviteRecord;

import java.util.List;

public interface UmsInviteRecordService {

    Long addInviteRecord(UmsInviteRecord inviteRecord);

    List<UmsInviteRecord> listInviteRecords(Long adminId, int pageNum, int pageSize);

}
