package com.macro.mall.portal.service;

import com.macro.mall.portal.domain.vo.PmsProductCategoryWithChildrenItem;

import java.util.List;

/**
 * 商品分类管理Service
 * Created by macro on 2018/4/26.
 */
public interface PmsProductCategoryService {

    /**
     * 以层级形式获取商品分类
     */
    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}
