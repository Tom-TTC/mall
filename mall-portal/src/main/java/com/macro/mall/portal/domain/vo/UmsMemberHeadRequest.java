package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class UmsMemberHeadRequest {

    @ApiModelProperty(value = "头像链接")
    @NotBlank
    private String headIconUrl;

}
