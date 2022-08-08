package com.macro.mall.domain.vo;

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
    @ApiModelProperty(value = "团长id")
    private Long id;

    @ApiModelProperty(value = "邀请码")
    private String inviteCode;

    @ApiModelProperty(value = "管理员积分")
    private Integer rewardPoint;

    @ApiModelProperty(value = "自我介绍")
    private String intro;

    @ApiModelProperty(value = "管理员账号名")
    private String username;

    @ApiModelProperty(value = "擅长领域，逗号隔开")
    private String skilledDomain;

    @ApiModelProperty(value = "管理员头像")
    private String headIcon;

    @ApiModelProperty(value = "管理员昵称")
    private String nickname;

    public UmsAdminInfoResponse(UmsAdminInfo request) {
        this(request.getId(),
                request.getInviteCode(),
                request.getRewardPoint(),
                request.getIntro(),
                request.getUsername(),
                request.getSkilledDomain(),
                request.getHeadIcon(),
                request.getNickname());
    }

}