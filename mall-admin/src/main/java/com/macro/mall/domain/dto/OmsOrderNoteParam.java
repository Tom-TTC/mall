package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/21 18:49
 * @desc ...
 */
@Data
@Accessors(chain = true)
public class OmsOrderNoteParam {
    @ApiModelProperty(value = "订单sn")
    @NotNull(message = "订单sn不能为空")
    private String orderSn;

    @ApiModelProperty(value = "订单备注")
    @NotNull(message = "备注不能为空")
    private String note;
}
