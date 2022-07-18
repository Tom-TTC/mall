package com.macro.mall.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class PmsSkuResponse implements Serializable {

    @ApiModelProperty(value = "id")
    private Long id;

    @ApiModelProperty(value = "价格，最多两位小数")
    private BigDecimal price;

    @ApiModelProperty(value = "佣金比例，0-100之间的整数")
    private Integer rebateRate;

    @ApiModelProperty(value = "sku名称")
    private String skuName;

    @ApiModelProperty(value = "排序")
    private Byte order;

}