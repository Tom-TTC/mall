package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ProductFavRequest {
    @ApiModelProperty(value = "会员id",hidden = true)
    private Long memberId;

    @ApiModelProperty(value = "商品id")
    private Long productId;

    @ApiModelProperty(value = "邀请码")
    private String inviteCode;
}
