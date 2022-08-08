package com.macro.mall.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.api.Operation;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class SmsHomeAdvertiseRequest implements Serializable {
    @ApiModelProperty(value = "广告id")
    @NotNull(groups = {Operation.Update.class}, message = "广告标题不能为空")
    private Long id;

    @ApiModelProperty(value = "团长id", hidden = true)
    private Long adminId;

    @ApiModelProperty(value = "广告标题")
    @NotBlank(message = "广告标题不能为空",groups = {Operation.Creation.class})
    private String name;

    @ApiModelProperty(value = "广告图片")
    @NotBlank(message = "广告图片不能为空",groups = {Operation.Creation.class})
    private String pic;

    @ApiModelProperty(value = "生效时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime startTime;

    @ApiModelProperty(value = "失效时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime endTime;

    @ApiModelProperty(value = "链接地址")
    private String url;

    @ApiModelProperty(value = "备注")
    private String note;

    @ApiModelProperty(value = "排序")
    private Integer sort;

}