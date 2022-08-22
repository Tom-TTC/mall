package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class UmsMemberPhoneRequest {

    @ApiModelProperty(value = "号码")
    @NotBlank(message = "用户号码不能为空")
    private String phone;

}
