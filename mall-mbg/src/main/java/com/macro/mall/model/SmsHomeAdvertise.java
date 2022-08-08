package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@JsonIgnoreProperties(value = {"adminId", "type", "clickCount", "orderCount"})
@Accessors(chain = true)
public class SmsHomeAdvertise implements Serializable {
    @ApiModelProperty(value = "广告id")
    private Long id;

    @ApiModelProperty(value = "团长id", required = false, hidden = true)
    private Long adminId;

    @ApiModelProperty(value = "广告标题")
    private String name;

    @ApiModelProperty(value = "轮播位置：0->PC首页轮播；1->app首页轮播")
    private Integer type;

    @ApiModelProperty(value = "广告图片")
    private String pic;

    @ApiModelProperty(value = "生效时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime startTime;

    @ApiModelProperty(value = "失效时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime endTime;

    @ApiModelProperty(value = "上下线状态：0->下线；1->上线")
    private Integer status;

    @ApiModelProperty(value = "点击数")
    private Integer clickCount;

    @ApiModelProperty(value = "下单数")
    private Integer orderCount;

    @ApiModelProperty(value = "链接地址")
    private String url;

    @ApiModelProperty(value = "备注")
    private String note;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    private static final long serialVersionUID = 1L;

    public SmsHomeAdvertise(Long adminId, String name, Integer type, String pic, LocalDateTime startTime, LocalDateTime endTime, String url, String note, Integer sort) {
        this.adminId = adminId;
        this.name = name;
        this.type = type;
        this.pic = pic;
        if (StringUtils.isEmpty(startTime)) {
            this.startTime = DateUtils.getCurrentTime();
        } else {
            this.startTime = startTime;
        }
        if (StringUtils.isEmpty(endTime)) {
            this.endTime = DateUtils.parseTime("2099-01-01 00:00");
        } else {
            this.endTime = endTime;
        }
        this.status = 0;
        this.url = url;
        this.note = note;
        this.sort = sort;
        this.clickCount = 0;
        this.orderCount = 0;
    }
}