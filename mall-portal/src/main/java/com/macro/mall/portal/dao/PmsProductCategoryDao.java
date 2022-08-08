package com.macro.mall.portal.dao;

import com.macro.mall.portal.domain.vo.PmsProductCategoryWithChildrenItem;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 商品分类自定义Dao
 * Created by macro on 2018/5/25.
 */
@Component
public interface PmsProductCategoryDao {
    /**
     * 获取商品分类及其子分类
     */
    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}
