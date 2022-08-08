package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UmsCooperationRequestBack implements Serializable {
    private Long id;

    @ApiModelProperty(value = "达人姓名")
    private String name;

    @ApiModelProperty(value = "达人联系方式")
    private String phone;

    @ApiModelProperty(value = "申请状态：0->未处理 1->已查阅")
    private Byte status;

    @ApiModelProperty(value = "团长id")
    private Long adminId;

    @ApiModelProperty(value = "会员id")
    private Long memberId;

    @ApiModelProperty(value = "留言")
    private String note;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    public UmsCooperationRequestBack(String name, String phone, Long adminId, Long memberId, String note) {
        this.name = name;
        this.phone = phone;
        this.adminId = adminId;
        this.memberId = memberId;
        this.note = note;
        this.status = 0;
        this.createTime = DateUtils.getCurrentTime();
    }
}