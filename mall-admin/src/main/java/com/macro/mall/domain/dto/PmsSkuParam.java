package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class PmsSkuParam implements Serializable {

    @ApiModelProperty(value = "价格，最多两位小数")
    @Min(value = 0, message = "价格无效")
    private BigDecimal price;

    @ApiModelProperty(value = "佣金比例，0-100之间的整数")
    @Min(value = 0, message = "佣金率至少为0")
    @Max(value = 99, message = "佣金率至多为99")
    private Integer rebateRate;

    @ApiModelProperty(value = "sku名称")
    @NotBlank(message = "sku名称不能为空")
    private String skuName;

}