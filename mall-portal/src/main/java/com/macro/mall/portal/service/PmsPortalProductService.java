package com.macro.mall.portal.service;

import com.macro.mall.model.PmsProduct;
import com.macro.mall.portal.domain.PmsProductCategoryNode;
import com.macro.mall.portal.domain.vo.PmsPortalProductDetail;
import com.macro.mall.portal.domain.vo.ProductFavRequest;
import com.macro.mall.portal.domain.vo.UmsMemberFavoriteProductResponse;

import java.util.List;

/**
 * 前台商品管理Service
 * Created by macro on 2020/4/6.
 */
public interface PmsPortalProductService {
    /**
     * 综合搜索商品
     */
    List<PmsProduct> search(String keyword, String inviteCode, Long productCategoryId, Integer pageNum, Integer pageSize, Integer sort, String order);

    /**
     * 以树形结构获取所有商品分类
     */
    List<PmsProductCategoryNode> categoryTreeList();

    /**
     * 获取前台商品详情
     */
    PmsPortalProductDetail detail(Long id);

    /**
     * 获取前台商品详情，并判断是否已收藏
     */
    PmsPortalProductDetail detailWithCollected(Long memberId, Long id);

    /**
     * 添加到收藏
     *
     * @param request
     * @return
     */
    long addToFav(ProductFavRequest request);

    /**
     * 取消收藏
     *
     * @param favId
     * @param memberId
     * @return
     */
    int cancelFav(Long favId, Long memberId);

    /**
     * 分页查询收藏商品
     *
     * @param pageNum
     * @param pageSize
     * @param memberId
     * @param inviteCode
     * @return
     */
    List<UmsMemberFavoriteProductResponse> queryFavs(int pageNum, int pageSize, Long memberId, String inviteCode);

}
