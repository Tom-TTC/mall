package com.macro.mall.mapper;

import com.macro.mall.model.UmsInviteRecord;
import com.macro.mall.model.UmsInviteRecordExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsInviteRecordMapper {
    long countByExample(UmsInviteRecordExample example);

    int deleteByExample(UmsInviteRecordExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsInviteRecord record);

    int insertSelective(UmsInviteRecord record);

    List<UmsInviteRecord> selectByExample(UmsInviteRecordExample example);

    UmsInviteRecord selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsInviteRecord record, @Param("example") UmsInviteRecordExample example);

    int updateByExample(@Param("record") UmsInviteRecord record, @Param("example") UmsInviteRecordExample example);

    int updateByPrimaryKeySelective(UmsInviteRecord record);

    int updateByPrimaryKey(UmsInviteRecord record);
}