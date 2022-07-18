package com.macro.mall.dao;

import com.macro.mall.domain.vo.PmsProductResponse;
import org.apache.ibatis.annotations.Param;


/**
 * 商品管理自定义Dao
 * Created by macro on 2018/4/26.
 */
public interface PmsProductDao {
    /**
     * 获取商品编辑信息
     */
    PmsProductResponse getProductDetail(@Param("id") Long id);
}
