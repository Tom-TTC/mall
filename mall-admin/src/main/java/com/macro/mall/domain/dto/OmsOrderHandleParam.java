package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 订单发货参数
 * Created by macro on 2018/10/12.
 */
@Getter
@Setter
public class OmsOrderHandleParam {
    @ApiModelProperty("订单更新状态，1->同意寄样；2->拒绝寄样")
    @NotNull(message = "订单状态不能为空")
    @Range(max = 2, min = 1, message = "订单状态无效")
    private Integer orderStatus;

    @ApiModelProperty(value = "订单当前状态列表，以英文逗号隔开", hidden = true)
    private String currentStatusList;

    @ApiModelProperty("订单sn")
    @NotNull(message = "订单sn不能为空")
    private String orderSn;

    @ApiModelProperty("拒绝原因")
    private String denyReason;

    @ApiModelProperty("物流公司")
    private String deliveryCompany;

    @ApiModelProperty("物流单号")
    private String deliverySn;

    @ApiModelProperty(value = "团长id", hidden = true)
    private Long adminId;


}
