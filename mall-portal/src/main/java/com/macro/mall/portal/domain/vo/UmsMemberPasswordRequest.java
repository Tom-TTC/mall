package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class UmsMemberPasswordRequest {
    @ApiModelProperty(value = "手机号")
    @NotBlank(message = "手机号不能为空")
    private String telephone;

    @ApiModelProperty(value = "密码")
    @NotBlank(message = "密码不能为空")
    private String password;

    @ApiModelProperty(value = "验证码")
    @NotBlank(message = "验证码不能为空")
    private String authCode;
}
