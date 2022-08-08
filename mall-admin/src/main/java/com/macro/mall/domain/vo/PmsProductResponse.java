package com.macro.mall.domain.vo;

import com.macro.mall.common.utils.DateUtils;
import com.macro.mall.model.PmsProduct;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.util.List;

/**
 * 查询单个商品修改后返回的结果
 * Created by macro on 2018/4/26.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PmsProductResponse {
    @ApiModelProperty(value = "商品id")
    private Long id;

    @ApiModelProperty(value = "商品分类id")
    private Long productCategoryId;

    @ApiModelProperty(value = "商品分类名称")
    private String productCategoryName;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "货号")
    private String productSn;

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

    @ApiModelProperty(value = "商品链接")
    private String productLink;

    @ApiModelProperty(value = "商品主图，连产品图片限制为5张，以逗号分割")
    private String albumPics;

    @ApiModelProperty(value = "直播手卡图片，连产品图片限制为5张，以逗号分割")
    private String liveStreamPics;

    @ApiModelProperty(value = "创建时间")
    private String createTime;

    @ApiModelProperty(value = "更新时间")
    private String updateTime;

    @ApiModelProperty(value = "产品详情网页内容")
    private String detailHtml;

    @ApiModelProperty("商品的sku信息")
    private List<PmsSkuResponse> skuList;

    /**
     * 填充第一个sku的价格和返佣率
     */
    public void fillRebateRate() {
        if (!CollectionUtils.isEmpty(skuList)) {
            this.rebateRate = skuList.get(0).getRebateRate();
            this.price = skuList.get(0).getPrice();
        }
    }

    public BigDecimal getPrice() {
        if (price == null) {
            if (!CollectionUtils.isEmpty(skuList)) {
                return skuList.get(0).getPrice();
            }
        }
        return price;
    }

    public Integer getRebateRate() {
        if (rebateRate == null || rebateRate == 0) {
            if (!CollectionUtils.isEmpty(skuList)) {
                return skuList.get(0).getRebateRate();
            }
        }
        return rebateRate;
    }

    public PmsProductResponse(PmsProduct product) {
        this(product.getId(),
                product.getProductCategoryId(),
                product.getProductCategoryName(),
                product.getName(),
                product.getProductSn(),
                product.getShopName(),
                product.getPublishStatus(),
                product.getVerifyStatus(),
                product.getPrice(),
                product.getRebateRate(),
                product.getProductLink(),
                product.getAlbumPics(),
                product.getPic(),
                DateUtils.formatLocalDateTimeToString(product.getCreateTime()),
                DateUtils.formatLocalDateTimeToString(product.getUpdateTime()),
                product.getDetailHtml(),
                null
        );
    }
}
