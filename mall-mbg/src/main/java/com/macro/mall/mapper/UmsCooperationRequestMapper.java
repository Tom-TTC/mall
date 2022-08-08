package com.macro.mall.mapper;

import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.model.UmsCooperationRequestExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsCooperationRequestMapper {
    long countByExample(UmsCooperationRequestExample example);

    int deleteByExample(UmsCooperationRequestExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsCooperationRequest record);

    int insertSelective(UmsCooperationRequest record);

    List<UmsCooperationRequest> selectByExample(UmsCooperationRequestExample example);

    UmsCooperationRequest selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsCooperationRequest record, @Param("example") UmsCooperationRequestExample example);

    int updateByExample(@Param("record") UmsCooperationRequest record, @Param("example") UmsCooperationRequestExample example);

    int updateByPrimaryKeySelective(UmsCooperationRequest record);

    int updateByPrimaryKey(UmsCooperationRequest record);
}