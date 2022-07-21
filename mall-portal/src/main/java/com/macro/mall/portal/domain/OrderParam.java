package com.macro.mall.portal.domain;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * 生成订单时传入的参数
 */
@Data
@EqualsAndHashCode
public class OrderParam {
    @ApiModelProperty(value = "商品id", required = true)
    @NotNull(message = "商品id不能为空")
    private Long productId;

    @ApiModelProperty(value = "收货地址", required = true)
    @NotBlank(message = "收货地址不能为空")
    private String receiverAddress;

    @ApiModelProperty(value = "微信号", required = true)
    @NotBlank(message = "微信号不能为空")
    private String wechatAccount;

    @ApiModelProperty(value = "收件人名称", required = true)
    @NotBlank(message = "收件人名称不能为空")
    private String receiverName;

    @ApiModelProperty(value = "手机号", required = true)
    @NotBlank(message = "手机号不能为空")
    private String receiverPhone;

    @ApiModelProperty(value = "会员id", hidden = true)
    private Long memberId;

    @ApiModelProperty(value = "会员名称", hidden = true)
    private String memberName;


}
