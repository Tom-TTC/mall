package com.macro.mall.portal.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UmsCooperationParam {

    @ApiModelProperty(value = "达人名称")
    @NotBlank(message = "达人名称不能为空")
    private String name;

    @ApiModelProperty(value = "手机号码")
    @NotBlank(message = "手机号码不能为空")
    private String phone;

    @ApiModelProperty(value = "邀请码")
    @NotBlank(message = "邀请码不能为空")
    private String inviteCode;

    @ApiModelProperty(value = "留言备注")
    @NotBlank(message = "留言备注不能为空")
    private String note;

    @ApiModelProperty(value = "会员id")
    private Long memberId;

}
