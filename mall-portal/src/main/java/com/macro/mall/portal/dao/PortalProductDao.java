package com.macro.mall.portal.dao;

import com.macro.mall.portal.domain.vo.PmsPortalProductDetail;
import com.macro.mall.portal.domain.vo.UmsMemberFavoriteProductResponse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 前台购物车商品管理自定义Dao
 * Created by macro on 2018/8/2.
 */
public interface PortalProductDao {
    PmsPortalProductDetail getProductDetail(@Param("id") Long id);

    /**
     * 分页查询收藏商品
     *
     * @param memberId
     * @param adminId
     * @return
     */
    List<UmsMemberFavoriteProductResponse> queryFavoriteProducts(@Param("memberId") Long memberId, @Param("adminId") Long adminId);
}
