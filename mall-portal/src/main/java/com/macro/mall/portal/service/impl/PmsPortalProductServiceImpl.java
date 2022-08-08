package com.macro.mall.portal.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.domain.ProductConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.mapper.PmsProductCategoryMapper;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.mapper.UmsMemberFavoriteProductMapper;
import com.macro.mall.model.*;
import com.macro.mall.portal.dao.PortalProductDao;
import com.macro.mall.portal.domain.PmsProductCategoryNode;
import com.macro.mall.portal.domain.vo.PmsPortalProductDetail;
import com.macro.mall.portal.domain.vo.ProductFavRequest;
import com.macro.mall.portal.domain.vo.UmsMemberFavoriteProductResponse;
import com.macro.mall.portal.service.PmsPortalProductService;
import com.macro.mall.portal.service.UmsAdminService;
import io.micrometer.core.instrument.util.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 前台订单管理Service实现类
 * Created by macro on 2020/4/6.
 */
@Service
public class PmsPortalProductServiceImpl implements PmsPortalProductService {
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsProductCategoryMapper productCategoryMapper;
    @Autowired
    private PortalProductDao portalProductDao;

    @Autowired
    private UmsMemberFavoriteProductMapper favoriteProductMapper;

    @Autowired
    private UmsAdminService adminService;


    @Override
    public List<PmsProduct> search(String keyword, String inviteCode, Long productCategoryId, Integer pageNum, Integer pageSize, Integer sort, String order) {
        Long adminId = adminService.getAdminIdByInviteCode(inviteCode);
        PageHelper.startPage(pageNum, pageSize);
        PmsProductExample example = new PmsProductExample();
        //基本条件：团长id，上架状态为已上架，删除状态为未删除
        PmsProductExample.Criteria criteria = example.createCriteria()
                .andCreateUserIdEqualTo(adminId)
                .andPublishStatusEqualTo(1)
                .andDeleteStatusEqualTo(0);
        if (StringUtils.isNotEmpty(keyword)) {
            criteria.andNameLike("%" + keyword + "%");
        }
        if (productCategoryId != null) {
            criteria.andProductCategoryIdEqualTo(productCategoryId);
        }
        if (!Objects.equals(order, "asc")) {
            order = "desc";
        }
        if (Objects.equals(sort, 1)) {
            example.setOrderByClause("rebate_rate " + order);
        } else if (Objects.equals(sort, 2)) {
            example.setOrderByClause("price " + order);
        } else {
            example.setOrderByClause("id " + order);
        }

        List<PmsProduct> result = productMapper.selectByExample(example);
        return result;
    }

    @Override
    public List<PmsProductCategoryNode> categoryTreeList() {
        PmsProductCategoryExample example = new PmsProductCategoryExample();
        List<PmsProductCategory> allList = productCategoryMapper.selectByExample(example);
        List<PmsProductCategoryNode> result = allList.stream()
                .filter(item -> item.getParentId().equals(0L))
                .map(item -> covert(item, allList)).collect(Collectors.toList());
        return result;
    }

    @Override
    public PmsPortalProductDetail detail(Long id) {
        PmsPortalProductDetail result = portalProductDao.getProductDetail(id);
        if (result == null) {
            Asserts.fail(ProductConstant.PRODUCT_NOT_EXISTED);
        }
        return result;
    }

    /**
     * 添加到收藏
     *
     * @param request
     * @return
     */
    @Override
    @Transactional
    public long addToFav(ProductFavRequest request) {
        //1.查询团长id
        Long adminId = adminService.getAdminIdByInviteCode(request.getInviteCode());

        //2.判断产品是否存在
        PmsProduct product = productMapper.selectByPrimaryKey(request.getProductId());
        if (product == null) {
            Asserts.fail(ProductConstant.PRODUCT_NOT_EXISTED);
        }

        //3.判断产品是否已收藏
        UmsMemberFavoriteProductExample example = new UmsMemberFavoriteProductExample();
        example.createCriteria()
                .andProductIdEqualTo(request.getProductId())
                .andMemberIdEqualTo(request.getMemberId());
        List<UmsMemberFavoriteProduct> favs = favoriteProductMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(favs)) {
            Asserts.fail(CommonConstant.FAVORITE_PRODUCT_ALREADY_ADDED);
        }

        //4.插入收藏记录
        UmsMemberFavoriteProduct favoriteProduct = new UmsMemberFavoriteProduct(request.getMemberId(), request.getProductId(), adminId);
        favoriteProductMapper.insert(favoriteProduct);

        return favoriteProduct.getId();
    }

    /**
     * 取消收藏
     *
     * @param favId
     * @param memberId
     * @return
     */
    @Override
    @Transactional
    public int cancelFav(Long favId, Long memberId) {
        UmsMemberFavoriteProductExample example = new UmsMemberFavoriteProductExample();
        example.createCriteria()
                .andIdEqualTo(favId)
                .andMemberIdEqualTo(memberId);
        int count = favoriteProductMapper.deleteByExample(example);
        return count;
    }

    /**
     * 分页查询收藏商品
     *
     * @param pageNum
     * @param pageSize
     * @param memberId
     * @param inviteCode
     * @return
     */
    @Override
    public List<UmsMemberFavoriteProductResponse> queryFavs(int pageNum, int pageSize, Long memberId, String inviteCode) {
        Long adminId = adminService.getAdminIdByInviteCode(inviteCode);
        PageHelper.startPage(pageNum, pageSize);
        List<UmsMemberFavoriteProductResponse> result = portalProductDao.queryFavoriteProducts(memberId, adminId);
        return result;
    }


    /**
     * 初始对象转化为节点对象
     */
    private PmsProductCategoryNode covert(PmsProductCategory item, List<PmsProductCategory> allList) {
        PmsProductCategoryNode node = new PmsProductCategoryNode();
        BeanUtils.copyProperties(item, node);
        List<PmsProductCategoryNode> children = allList.stream()
                .filter(subItem -> subItem.getParentId().equals(item.getId()))
                .map(subItem -> covert(subItem, allList)).collect(Collectors.toList());
        node.setChildren(children);
        return node;
    }
}
