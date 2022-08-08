package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

/**
 * 用户注册参数
 * Created by macro on 2018/4/26.
 */
@Getter
@Setter
public class UmsAdminParam {

    @ApiModelProperty(value = "用户名", required = true)
    @NotBlank(message = "用户名不能为空")
    private String username;

    @ApiModelProperty(value = "密码", required = true)
    @NotBlank(message = "密码不能为空")
    private String password;

    @ApiModelProperty(value = "邀请码", required = true)
    @NotBlank(message = "邀请码不能为空")
    private String inviteCode;

    @Email
    @ApiModelProperty(value = "邮箱",hidden = true)
    private String email;

}
