package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WechatToken {
    @ApiModelProperty(value = "token")
    private String token;
    @ApiModelProperty(value = "token头")
    private String tokenHead;
    @ApiModelProperty(value = "微信openId")
    private String openId;

}
