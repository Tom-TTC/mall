package com.macro.mall.portal.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.macro.mall.model.UmsMember;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

@Data
@Accessors(chain = true)
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true,value = {"password"})
public class UmsMemberInfo implements Serializable {
    @ApiModelProperty(value = "用户id")
    private Long id;

    @ApiModelProperty(value = "会员等级")
    private Long memberLevelId;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "密码")
    private String password;

    @ApiModelProperty(value = "昵称")
    private String nickname;

    @ApiModelProperty(value = "手机号码")
    private String phone;

    @ApiModelProperty(value = "帐号启用状态:0->禁用；1->启用")
    private Integer status;

    @ApiModelProperty(value = "注册时间")
    private Date createTime;

    @ApiModelProperty(value = "头像")
    private String icon;

    @ApiModelProperty(value = "性别：0->未知；1->男；2->女")
    private Integer gender;

    @ApiModelProperty(value = "生日")
    private Date birthday;

    @ApiModelProperty(value = "所在城市")
    private String city;

    @ApiModelProperty(value = "职业")
    private String job;

    public UmsMemberInfo(UmsMember member) {
        this(member.getId(),
                member.getMemberLevelId(),
                member.getUsername(),
                member.getPassword(),
                member.getNickname(),
                member.getPhone(),
                member.getStatus(),
                member.getCreateTime(),
                member.getIcon(),
                member.getGender(),
                member.getBirthday(),
                member.getCity(),
                member.getJob());
    }
}