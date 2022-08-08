package com.macro.mall.portal.service.impl;

import com.macro.mall.portal.dao.PmsProductCategoryDao;
import com.macro.mall.portal.domain.vo.PmsProductCategoryWithChildrenItem;
import com.macro.mall.portal.service.PmsProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品分类管理Service实现类
 * Created by macro on 2018/4/26.
 */
@Service
public class PmsProductCategoryServiceImpl implements PmsProductCategoryService {
    @Autowired
    private PmsProductCategoryDao productCategoryDao;


    @Override
    public List<PmsProductCategoryWithChildrenItem> listWithChildren() {
        return productCategoryDao.listWithChildren();
    }
}
