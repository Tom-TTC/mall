package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class WechatLoginParam {

    @ApiModelProperty(value = "微信授权码")
    @NotBlank(message = "授权码不能为空")
    private String code;
    @ApiModelProperty(value = "参数")
    private String rawData;
    @ApiModelProperty(value = "参数签名")
    private String signature;

}
