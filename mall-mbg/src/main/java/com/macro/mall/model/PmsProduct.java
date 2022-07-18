package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.macro.mall.common.domain.ProductConstant;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

@Data
@NoArgsConstructor
@JsonInclude(value = JsonInclude.Include.NON_NULL)
public class PmsProduct implements Serializable {
    private Long id;

    @ApiModelProperty(value = "商品分类id")
    private Long productCategoryId;

    @ApiModelProperty(value = "商品分类名称")
    private String productCategoryName;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "店铺名称")
    private String shopName;

    @ApiModelProperty(value = "货号")
    private String productSn;

    @ApiModelProperty(value = "删除状态：0->未删除；1->已删除")
    private Integer deleteStatus;

    @ApiModelProperty(value = "上架状态：0->下架；1->上架")
    private Integer publishStatus;

    @ApiModelProperty(value = "新品状态:0->不是新品；1->新品")
    private Integer newStatus;

    @ApiModelProperty(value = "推荐状态；0->不推荐；1->推荐")
    private Integer recommandStatus;

    @ApiModelProperty(value = "审核状态：0->未审核；1->审核通过")
    private Integer verifyStatus;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "销量")
    private Integer sale;

    @ApiModelProperty(value = "商品价格")
    private BigDecimal price;

    @ApiModelProperty(value = "促销价格")
    private BigDecimal promotionPrice;

    @ApiModelProperty(value = "商品链接")
    private String productLink;

    @ApiModelProperty(value = "市场价")
    private BigDecimal originalPrice;

    @ApiModelProperty(value = "画册图片，连产品图片限制为5张，以逗号分割")
    private String albumPics;

    @ApiModelProperty(value = "商品头像")
    private String pic;

    @ApiModelProperty(value = "创建者id")
    private Long createUserId;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "商品描述")
    private String description;

    @ApiModelProperty(value = "产品详情网页内容")
    private String detailHtml;

    @ApiModelProperty(value = "移动端网页详情")
    private String detailMobileHtml;

    private static final long serialVersionUID = 1L;

    public PmsProduct(Long id,
                      Long productCategoryId,
                      String productCategoryName,
                      String name,
                      String shopName,
                      String productLink,
                      String albumPics,
                      Long createUserId,
                      String detailHtml,
                      String productSn) {
        this.id = id;
        this.productCategoryId = productCategoryId;
        this.productCategoryName = productCategoryName;
        this.name = name;
        this.shopName = shopName;
        this.productLink = productLink;
        this.albumPics = albumPics;
        this.createUserId = createUserId;
        this.detailHtml = detailHtml;
        this.productSn = productSn;
        this.deleteStatus = ProductConstant.NOT_DELETED;
        this.publishStatus = ProductConstant.NOT_ONLINE;
        this.verifyStatus = ProductConstant.NOT_VARIFIED;
        this.createTime = DateUtils.getCurrentTime();
        this.updateTime = this.createTime;
    }

    public void updateProduct(PmsProduct newProduct) {
        this.productCategoryId = newProduct.productCategoryId;
        this.productCategoryName = newProduct.productCategoryName;
        this.name = newProduct.name;
        this.shopName = newProduct.shopName;
        this.productLink = newProduct.productLink;
        this.albumPics = newProduct.albumPics;
        this.detailHtml = newProduct.detailHtml;
        this.updateTime = DateUtils.getCurrentTime();
    }
}