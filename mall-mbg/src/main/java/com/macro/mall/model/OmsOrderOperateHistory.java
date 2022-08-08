package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

@Data
public class OmsOrderOperateHistory implements Serializable {
    private Long id;

    @ApiModelProperty(value = "订单sn")
    private String orderSn;

    @ApiModelProperty(value = "操作人：用户；系统；后台管理员")
    private String operateMan;

    @ApiModelProperty(value = "订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单")
    private Integer orderStatus;

    @ApiModelProperty(value = "操作时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "备注")
    private String note;

    private static final long serialVersionUID = 1L;

}