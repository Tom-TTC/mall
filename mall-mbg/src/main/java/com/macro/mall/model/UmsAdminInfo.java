package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.util.StringUtils;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class UmsAdminInfo implements Serializable {
    @ApiModelProperty(value = "管理员id（与ums_admin表一致）")
    private Long id;

    @ApiModelProperty(value = "邀请码")
    private String inviteCode;

    @ApiModelProperty(value = "管理员积分")
    private Integer rewardPoint;

    @ApiModelProperty(value = "自我介绍")
    private String intro;

    @ApiModelProperty(value = "管理员账号名称")
    private String username;

    @ApiModelProperty(value = "擅长领域，逗号隔开")
    private String skilledDomain;

    @ApiModelProperty(value = "管理员头像")
    private String headIcon;

    @ApiModelProperty(value = "管理员昵称")
    private String nickname;

    public UmsAdminInfo(Long id, String intro, String skilledDomain, String headIcon, String nickname) {
        this.id = id;
        this.intro = intro;
        this.skilledDomain = skilledDomain;
        this.headIcon = headIcon;
        this.nickname = nickname;
    }

    public String getNickname() {
        if (StringUtils.isEmpty(nickname)) {
            return username;
        }
        return nickname;
    }
}