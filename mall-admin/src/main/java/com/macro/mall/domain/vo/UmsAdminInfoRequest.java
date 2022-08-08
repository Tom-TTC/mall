package com.macro.mall.domain.vo;

import com.macro.mall.common.api.Operation;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class UmsAdminInfoRequest implements Serializable {
    @ApiModelProperty(value = "团长id", hidden = true)
    private Long id;

    /*@ApiModelProperty(value = "邀请码",hidden = true)
    @NotBlank(groups = {Operation.Creation.class}, message = "邀请码不能为空")
    private String inviteCode;*/

    @ApiModelProperty(value = "管理员积分",hidden = true)
    private Integer rewardPoint;

    @ApiModelProperty(value = "自我介绍")
    @NotBlank(groups = {Operation.Creation.class}, message = "自我介绍不能为空")
    private String intro;

    @ApiModelProperty(value = "管理员账号名", hidden = true)
    private String username;

    @ApiModelProperty(value = "擅长领域，逗号隔开")
    @NotBlank(groups = {Operation.Creation.class}, message = "擅长领域不能为空")
    private String skilledDomain;

    @ApiModelProperty(value = "管理员头像")
    private String headIcon;

    @ApiModelProperty(value = "管理员昵称")
    private String nickname;

}