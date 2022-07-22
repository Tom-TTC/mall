package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;

public class UmsAdminInfo implements Serializable {
    @ApiModelProperty(value = "管理员id（与ums_admin表一致）")
    private Long id;

    @ApiModelProperty(value = "邀请码")
    private String inviteCode;

    @ApiModelProperty(value = "管理员积分")
    private Integer rewardPoint;

    @ApiModelProperty(value = "自我介绍")
    private String intro;

    @ApiModelProperty(value = "管理员名称")
    private String name;

    @ApiModelProperty(value = "擅长领域，逗号隔开")
    private String skilledDomain;

    @ApiModelProperty(value = "管理员头像")
    private String headIcon;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    public Integer getRewardPoint() {
        return rewardPoint;
    }

    public void setRewardPoint(Integer rewardPoint) {
        this.rewardPoint = rewardPoint;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSkilledDomain() {
        return skilledDomain;
    }

    public void setSkilledDomain(String skilledDomain) {
        this.skilledDomain = skilledDomain;
    }

    public String getHeadIcon() {
        return headIcon;
    }

    public void setHeadIcon(String headIcon) {
        this.headIcon = headIcon;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", inviteCode=").append(inviteCode);
        sb.append(", rewardPoint=").append(rewardPoint);
        sb.append(", intro=").append(intro);
        sb.append(", name=").append(name);
        sb.append(", skilledDomain=").append(skilledDomain);
        sb.append(", headIcon=").append(headIcon);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}