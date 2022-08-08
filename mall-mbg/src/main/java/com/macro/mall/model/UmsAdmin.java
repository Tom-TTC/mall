package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UmsAdmin implements Serializable {
    @ApiModelProperty(value = "账号id")
    private Long id;

    @ApiModelProperty(value = "账号名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "头像")
    private String icon;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "备注信息")
    private String note;

    @ApiModelProperty(value = "邀请码")
    private String inviteCode;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "最后登录时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime loginTime;

    @ApiModelProperty(value = "帐号启用状态：0->禁用；1->启用")
    private Integer status;

    private static final long serialVersionUID = 1L;

    public UmsAdmin(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.status=1;
        this.createTime= DateUtils.getCurrentTime();
    }
}