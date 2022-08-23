package com.macro.mall.portal.domain.vo;

import com.macro.mall.model.UmsAdminInfo;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UmsAdminInfoResponse implements Serializable {
    @ApiModelProperty(value = "邀请码")
    private String inviteCode;

    @ApiModelProperty(value = "自我介绍")
    private String intro;

    @ApiModelProperty(value = "管理员账号名")
    private String username;

    @ApiModelProperty(value = "管理员手机号")
    private String phone;

    @ApiModelProperty(value = "擅长领域，逗号隔开")
    private String skilledDomain;

    @ApiModelProperty(value = "管理员头像")
    private String headIcon;

    @ApiModelProperty(value = "管理员昵称")
    private String nickname;

    public UmsAdminInfoResponse(UmsAdminInfo request) {
        this(request.getInviteCode(),
                request.getIntro(),
                request.getUsername(),
                request.getPhone(),
                request.getSkilledDomain(),
                request.getHeadIcon(),
                request.getNickname());
    }

}