package com.macro.mall.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.macro.mall.common.api.CommonPage;
import com.macro.mall.domain.dto.PmsProductParam;
import com.macro.mall.domain.dto.PmsProductQueryParam;
import com.macro.mall.domain.vo.PmsProductIds;
import com.macro.mall.domain.vo.PmsProductPublishParam;
import com.macro.mall.domain.vo.PmsProductResponse;
import com.macro.mall.domain.vo.PmsProductVerifyParam;
import com.macro.mall.model.PmsProduct;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 商品管理Service
 * Created by macro on 2018/4/26.
 */
public interface PmsProductService {
    /**
     * 创建商品
     */
    @Transactional(isolation = Isolation.DEFAULT, propagation = Propagation.REQUIRED)
    long create(PmsProductParam productParam);

    /**
     * 根据商品编号获取更新信息
     */
    PmsProductResponse getProductDetail(Long id);

    /**
     * 更新商品
     */
    @Transactional
    long update(PmsProductParam productParam);

    /**
     * 分页查询商品
     */
    List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum);

    /**
     * 批量修改审核状态
     *
     * @param verifyParam 审核参数
     */
    @Transactional
    int updateVerifyStatus(PmsProductVerifyParam verifyParam);

    /**
     * 批量修改商品上架状态
     */
    int updatePublishStatus(PmsProductPublishParam publishParam);

    /**
     * 批量修改商品推荐状态
     */
    int updateRecommendStatus(List<Long> ids, Integer recommendStatus);

    /**
     * 批量修改新品状态
     */
    int updateNewStatus(List<Long> ids, Integer newStatus);

    /**
     * 批量删除商品
     */
    int updateDeleteStatus(PmsProductIds productIds);

    /**
     * 根据商品名称或者货号模糊查询
     */
    List<PmsProduct> list(String keyword);
}
