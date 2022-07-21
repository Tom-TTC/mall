package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.domain.ProductConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.dao.*;
import com.macro.mall.domain.dto.PmsProductParam;
import com.macro.mall.domain.dto.PmsProductQueryParam;
import com.macro.mall.domain.vo.*;
import com.macro.mall.domain.dto.PmsSkuParam;
import com.macro.mall.mapper.*;
import com.macro.mall.model.*;
import com.macro.mall.service.PmsProductCategoryService;
import com.macro.mall.service.PmsProductService;
import com.macro.mall.utils.ProductUtils;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 商品管理Service实现类
 * Created by macro on 2018/4/26.
 */
@Service
@Slf4j
public class PmsProductServiceImpl implements PmsProductService {
    private static final Logger LOGGER = LoggerFactory.getLogger(PmsProductServiceImpl.class);
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsSkuStockDao skuStockDao;
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private PmsProductDao productDao;
    @Autowired
    private PmsProductVertifyRecordDao productVertifyRecordDao;

    @Autowired
    private PmsProductCategoryService productCategoryService;

    @Override
    public long create(PmsProductParam productParam) {
        //创建商品
        PmsProduct product = prehandleProductParam(productParam);
        product.setId(null);
        productMapper.insertSelective(product);
        //根据促销类型设置价格：会员价格、阶梯价格、满减价格
        Long productId = product.getId();
        //处理sku的编码
        List<PmsSkuStock> skuStocks = transformSkuStock(productParam.getSkuList(), productId);
        //添加sku库存信息
        skuStockDao.insertList(skuStocks);
        return productId;
    }

    private PmsProduct prehandleProductParam(PmsProductParam productParam) {
        //1.参数校验 album
        if (productParam.getAlbumPics().split(",").length > CommonConstant.NUM_5) {
            //主图最多5张
            Asserts.fail(CommonConstant.PRODUCT_PIC_LIMIT_5);
        }

        if (productParam.getSkuList().size() > CommonConstant.NUM_5) {
            //一个商品最多5个sku
            Asserts.fail(CommonConstant.PRODUCT_SKU_LIMIT_5);
        }

        //2.参数处理 ，查询分类名称
        String categoryName = null;
        PmsProductCategory productCategory = productCategoryService.getItem(productParam.getProductCategoryId());
        if (productCategory != null && !StringUtils.isEmpty(productCategory.getName())) {
            categoryName = productCategory.getName();
        } else {
            Asserts.fail(CommonConstant.PRODUCT_CATEGORY_INVALID);
        }

        //3.生成product
        PmsProduct product = new PmsProduct(productParam.getId(),
                productParam.getProductCategoryId(),
                categoryName,
                productParam.getName(),
                productParam.getShopName(),
                productParam.getProductLink(),
                productParam.getAlbumPics(),
                productParam.getCreateUserId(),
                productParam.getDetailHtml(),
                ProductUtils.getProductSn());

        return product;
    }

    private List<PmsSkuStock> transformSkuStock(List<PmsSkuParam> skuStockList, Long productId) {
        if (CollectionUtils.isEmpty(skuStockList)) return null;
        List<PmsSkuStock> skuStocks = Lists.newArrayList();
        PmsSkuParam skuStockParam = null;
        PmsSkuStock skuStock = null;
        for (int i = 0; i < skuStockList.size(); i++) {
            skuStockParam = skuStockList.get(i);
            skuStock = PmsSkuStock.builder()
                    .skuName(skuStockParam.getSkuName())
                    .productId(productId)
                    .skuCode(ProductUtils.getSkuCode(productId, i))
                    .price(skuStockParam.getPrice())
                    .rebateRate(skuStockParam.getRebateRate())
                    .order((byte) i)
                    .build();
            skuStocks.add(skuStock);
        }
        return skuStocks;
    }

    @Override
    public PmsProductResponse getProductDetail(Long id) {
        PmsProductResponse productResponse = productDao.getProductDetail(id);
        if (productResponse == null) {
            Asserts.fail(ProductConstant.PRODUCT_NOT_EXISTED);
        }
        productResponse.getSkuList().sort((s1, s2) -> s1.getOrder().compareTo(s2.getOrder()));
        PmsSkuResponse firstSku = productResponse.getSkuList().get(0);
        productResponse.setPrice(firstSku.getPrice());
        return productResponse;
    }

    @Override
    public long update(PmsProductParam productParam) {
        //预处理参数
        PmsProduct product = prehandleProductParam(productParam);
        //查询旧商品详情，注：此处要判断当前产品是否是当前登录用户创建（后期如果超级管理员能操作的话，还得改一下）
        PmsProductExample productExample = new PmsProductExample();
        productExample.createCriteria()
                .andIdEqualTo(product.getId())
                .andCreateUserIdEqualTo(productParam.getCreateUserId());
        List<PmsProduct> oldProducts = productMapper.selectByExampleWithBLOBs(productExample);
        if (CollectionUtils.isEmpty(oldProducts)) {
            //商品不存在，报错
            Asserts.fail(ProductConstant.PRODUCT_NOT_EXISTED);
        }
        PmsProduct oldProduct = oldProducts.get(0);
        //更新属性到旧产品中（因为有些属性不让直接更新，创建人id，创建时间，各种状态等）
        oldProduct.updateProduct(product);

        productMapper.updateByPrimaryKeySelective(oldProduct);

        //先删除旧sku，再插入新sku库存信息
        PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
        skuStockExample.createCriteria().andProductIdEqualTo(product.getId());
        skuStockMapper.deleteByExample(skuStockExample);

        List<PmsSkuStock> skuStocks = transformSkuStock(productParam.getSkuList(), product.getId());
        //添加sku库存信息
        skuStockDao.insertList(skuStocks);

        return product.getId();
    }

    @Override
    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        if (!StringUtils.isEmpty(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }
        if (!StringUtils.isEmpty(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }
        return productMapper.selectByExample(productExample);
    }

    @Override
    public int updateVerifyStatus(PmsProductVerifyParam verifyParam) {
        PmsProduct product = new PmsProduct();
        product.setVerifyStatus(verifyParam.getVerifyStatus());
        PmsProductExample example = new PmsProductExample();
        example.createCriteria()
                .andIdIn(verifyParam.getIds())
                .andDeleteStatusEqualTo(CommonConstant.NOT_DELETED);
        List<PmsProductVertifyRecord> list = new ArrayList<>();
        int count = productMapper.updateByExampleSelective(product, example);
        if (count == 0) {
            log.info("审核失败，参数：{}", verifyParam);
            Asserts.fail(ProductConstant.PRODUCT_OPERATE_FAILED);
        }
        //修改完审核状态后插入审核记录
        for (Long id : verifyParam.getIds()) {
            PmsProductVertifyRecord record = new PmsProductVertifyRecord();
            record.setProductId(id);
            record.setCreateTime(new Date());
            record.setDetail(verifyParam.getDetail());
            record.setStatus(verifyParam.getVerifyStatus());
            record.setVertifyMan("test");
            list.add(record);
        }
        productVertifyRecordDao.insertList(list);
        return count;
    }

    @Override
    public int updatePublishStatus(PmsProductPublishParam publishParam) {
        PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishParam.getPublishStatus());
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(publishParam.getIds()).andDeleteStatusEqualTo(CommonConstant.NOT_DELETED);
        int count = productMapper.updateByExampleSelective(record, example);
        if (count == 0) {
            log.info("上、下架失败，参数：{}", publishParam);
            Asserts.fail(ProductConstant.PRODUCT_OPERATE_FAILED);
        }
        return count;
    }

    @Override
    public int updateRecommendStatus(List<Long> ids, Integer recommendStatus) {
        PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateNewStatus(List<Long> ids, Integer newStatus) {
        PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateDeleteStatus(PmsProductIds productIds) {
        PmsProduct record = new PmsProduct();
        record.setDeleteStatus(CommonConstant.DELETED);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria()
                .andIdIn(productIds.getIds())
                .andDeleteStatusEqualTo(CommonConstant.NOT_DELETED);
        int count = productMapper.updateByExampleSelective(record, example);
        if (count == 0) {
            log.info("删除商品失败，参数：{}", productIds);
            Asserts.fail(ProductConstant.PRODUCT_OPERATE_FAILED);
        }
        return count;
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (!StringUtils.isEmpty(keyword)) {
            criteria.andNameLike("%" + keyword + "%");
            productExample.or().andDeleteStatusEqualTo(0).andProductSnLike("%" + keyword + "%");
        }
        return productMapper.selectByExample(productExample);
    }

    /**
     * 建立和插入关系表操作
     *
     * @param dao       可以操作的dao
     * @param dataList  要插入的数据
     * @param productId 建立关系的id
     */
    private void relateAndInsertList(Object dao, List dataList, Long productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) return;
            for (Object item : dataList) {
                Method setId = item.getClass().getMethod("setId", Long.class);
                setId.invoke(item, (Long) null);
                Method setProductId = item.getClass().getMethod("setProductId", Long.class);
                setProductId.invoke(item, productId);
            }
            Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            LOGGER.warn("创建产品出错:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

}
