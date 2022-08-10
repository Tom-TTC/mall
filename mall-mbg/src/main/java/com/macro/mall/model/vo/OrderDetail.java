package com.macro.mall.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.model.OmsOrder;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/20 16:24
 * @desc ...
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class OrderDetail {
    @ApiModelProperty(value = "达人名称")
    private String memberUsername;

    @ApiModelProperty(value = "订单编号")
    private String orderSn;

    @ApiModelProperty(value = "商品id")
    private Long productId;

    @ApiModelProperty(value = "商品名称")
    private String productName;

    @ApiModelProperty(value = "画册图片，连产品图片限制为5张，以逗号分割")
    private String albumPics;

    @ApiModelProperty(value = "店铺名称")
    private String shopName;

    @ApiModelProperty(value = "达人微信号")
    private String wechatAccount;

    @ApiModelProperty(value = "物流公司(配送方式)")
    private String deliveryCompany;

    @ApiModelProperty(value = "物流单号")
    private String deliverySn;

    @ApiModelProperty(value = "收货人姓名")
    private String receiverName;

    @ApiModelProperty(value = "收货人电话")
    private String receiverPhone;

    @ApiModelProperty(value = "详细地址")
    private String receiverDetailAddress;

    @ApiModelProperty(value = "订单状态：0->待确认；1->已寄件；2->已拒绝；3->已取消")
    private Integer status;

    @ApiModelProperty(value = "发货时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime deliveryTime;

    @ApiModelProperty(value = "修改时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime modifyTime;

    @ApiModelProperty(value = "提交时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    public OrderDetail(String memberUsername,
                       String orderSn,
                       String wechatAccount,
                       String deliveryCompany,
                       String deliverySn,
                       String receiverName,
                       String receiverPhone,
                       String receiverDetailAddress,
                       Integer status,
                       LocalDateTime deliveryTime,
                       LocalDateTime modifyTime,
                       LocalDateTime createTime) {
        this.memberUsername = memberUsername;
        this.orderSn = orderSn;
        this.wechatAccount = wechatAccount;
        this.deliveryCompany = deliveryCompany;
        this.deliverySn = deliverySn;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverDetailAddress = receiverDetailAddress;
        this.status = status;
        this.deliveryTime = deliveryTime;
        this.modifyTime = modifyTime;
        this.createTime = createTime;
    }

    public OrderDetail(OmsOrder order) {
        this(order.getMemberUsername(), order.getOrderSn(), order.getWechatAccount(), order.getDeliveryCompany(),
                order.getDeliverySn(), order.getReceiverName(), order.getReceiverPhone(), order.getReceiverDetailAddress(),
                order.getStatus(), order.getDeliveryTime(), order.getModifyTime(), order.getCreateTime());
    }
}
