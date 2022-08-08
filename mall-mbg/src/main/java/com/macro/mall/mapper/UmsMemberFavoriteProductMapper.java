package com.macro.mall.mapper;

import com.macro.mall.model.UmsMemberFavoriteProduct;
import com.macro.mall.model.UmsMemberFavoriteProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsMemberFavoriteProductMapper {
    long countByExample(UmsMemberFavoriteProductExample example);

    int deleteByExample(UmsMemberFavoriteProductExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsMemberFavoriteProduct record);

    int insertSelective(UmsMemberFavoriteProduct record);

    List<UmsMemberFavoriteProduct> selectByExample(UmsMemberFavoriteProductExample example);

    UmsMemberFavoriteProduct selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsMemberFavoriteProduct record, @Param("example") UmsMemberFavoriteProductExample example);

    int updateByExample(@Param("record") UmsMemberFavoriteProduct record, @Param("example") UmsMemberFavoriteProductExample example);

    int updateByPrimaryKeySelective(UmsMemberFavoriteProduct record);

    int updateByPrimaryKey(UmsMemberFavoriteProduct record);
}