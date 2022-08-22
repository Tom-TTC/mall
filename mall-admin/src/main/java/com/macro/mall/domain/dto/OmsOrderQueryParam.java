package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * 订单查询参数
 * Created by macro on 2018/10/11.
 */
@Data
@Accessors(chain = true)
public class OmsOrderQueryParam {
    @ApiModelProperty(value = "订单编号")
    private String orderSn;
    @ApiModelProperty(value = "收货人姓名/号码")
    private String receiverKeyword;
    @ApiModelProperty(value = "订单状态：不传或-1->全部；0->待确认；1->已寄件；2->已拒绝；3->已取消;4->已处理（包括2和3）")
    private String status;
    @ApiModelProperty(value = "订单提交时间")
    private String createTime;
    @ApiModelProperty(value = "团长id", hidden = true)
    private Long adminId;
}
