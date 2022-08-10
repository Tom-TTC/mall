package com.macro.mall.portal.domain.vo;

import com.macro.mall.common.domain.vo.PmsSkuResponse;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

/**
 * 前台商品详情
 * Created by macro on 2020/4/6.
 */
@Getter
@Setter
public class PmsPortalProductDetail {
    @ApiModelProperty(value = "商品id")
    private Long id;

    @ApiModelProperty(value = "商品分类id")
    private Long productCategoryId;

    @ApiModelProperty(value = "货号")
    private String productSn;

    @ApiModelProperty(value = "创建人id")
    private Long createUserId;

    @ApiModelProperty(value = "商品分类名称")
    private String productCategoryName;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "店铺名称")
    private String shopName;

    @ApiModelProperty(value = "上架状态：0->下架；1->上架")
    private Integer publishStatus;

    @ApiModelProperty(value = "审核状态：0->未审核；1->审核通过")
    private Integer verifyStatus;

    @ApiModelProperty(value = "商品价格")
    private BigDecimal price;

    @ApiModelProperty(value = "佣金比例，0-100之间的整数")
    private Integer rebateRate;

    @ApiModelProperty(value="收藏标志，0->未收藏，1->已收藏")
    private Integer collected;

    @ApiModelProperty(value = "商品链接")
    private String productLink;

    @ApiModelProperty(value = "画册图片，连产品图片限制为5张，以逗号分割")
    private String albumPics;

    @ApiModelProperty(value = "创建时间")
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    private String updateTime;

    @ApiModelProperty(value = "产品详情网页内容")
    private String detailHtml;

    @ApiModelProperty("商品的sku信息")
    private List<PmsSkuResponse> skuList;
}
