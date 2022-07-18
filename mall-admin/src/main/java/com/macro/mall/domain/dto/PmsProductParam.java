package com.macro.mall.domain.dto;

import com.macro.mall.common.api.Operation;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 创建和修改商品的请求参数
 * Created by macro on 2018/4/26.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductParam {

    @ApiModelProperty(value = "商品id，更新接口必传", required = false)
    @NotNull(message = "商品id不能为空", groups = {Operation.Update.class})
    @Min(value = 1, message = "商品id无效", groups = {Operation.Update.class})
    private Long id;

    @ApiModelProperty(value = "商品分类id")
    @NotNull(message = "商品分类id不能为空")
    private Long productCategoryId;

    @ApiModelProperty(value = "商品名称")
    @NotBlank(message = "商品名称不能为空")
    private String name;

    @ApiModelProperty(value = "店铺名称")
    @NotBlank(message = "店铺名称不能为空")
    private String shopName;

    @ApiModelProperty(value = "商品链接")
    @NotBlank(message = "商品链接不能为空")
    private String productLink;

    @ApiModelProperty(value = "主图链接，最多5张，以英文逗号拼接")
    @NotBlank(message = "主图链接不能为空")
    private String albumPics;

    @ApiModelProperty(value = "商品详情网页内容")
    private String detailHtml;

    @ApiModelProperty("商品的sku信息")
    @NotNull(message = "商品sku信息不能为空")
    @Size(min = 1, max = 5, message = "一个产品的sku信息为1到5条")
    private List<PmsSkuParam> skuList;

    @ApiModelProperty(value = "创建者id", hidden = true)
    private Long createUserId;
}
