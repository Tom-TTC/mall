package com.macro.mall.mapper;

import com.macro.mall.model.UmsAdminInfo;
import com.macro.mall.model.UmsAdminInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsAdminInfoMapper {
    long countByExample(UmsAdminInfoExample example);

    int deleteByExample(UmsAdminInfoExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsAdminInfo record);

    int insertSelective(UmsAdminInfo record);

    List<UmsAdminInfo> selectByExample(UmsAdminInfoExample example);

    UmsAdminInfo selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsAdminInfo record, @Param("example") UmsAdminInfoExample example);

    int updateByExample(@Param("record") UmsAdminInfo record, @Param("example") UmsAdminInfoExample example);

    int updateByPrimaryKeySelective(UmsAdminInfo record);

    int updateByPrimaryKey(UmsAdminInfo record);
}