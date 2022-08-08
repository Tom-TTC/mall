package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.domain.OrderConstant;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@Accessors(chain = true)
public class OmsOrder implements Serializable {
    @ApiModelProperty(value = "订单id")
    private Long id;

    @ApiModelProperty(value = "用户id")
    private Long memberId;

    @ApiModelProperty(value = "订单编号")
    private String orderSn;

    @ApiModelProperty(value = "商品创建人id")
    private Long adminId;

    @ApiModelProperty(value = "商品id")
    private Long productId;

    @ApiModelProperty(value = "用户帐号")
    private String memberUsername;

    @ApiModelProperty(value = "收货人微信号")
    private String wechatAccount;

    @ApiModelProperty(value = "订单来源：0->PC订单;1->app订单;2->小程序")
    private Integer sourceType;

    @ApiModelProperty(value = "物流公司(配送方式)")
    private String deliveryCompany;

    @ApiModelProperty(value = "物流单号")
    private String deliverySn;

    @ApiModelProperty(value = "收货人姓名")
    private String receiverName;

    @ApiModelProperty(value = "收货人电话")
    private String receiverPhone;

    @ApiModelProperty(value = "省份/直辖市")
    private String receiverProvince;

    @ApiModelProperty(value = "城市")
    private String receiverCity;

    @ApiModelProperty(value = "区")
    private String receiverRegion;

    @ApiModelProperty(value = "详细地址")
    private String receiverDetailAddress;

    @ApiModelProperty(value = "订单备注")
    private String note;

    @ApiModelProperty(value = "订单状态：0->待确认；1->已寄件；2->已拒绝；3->已取消")
    private Integer status;

    @ApiModelProperty(value = "拒绝原因")
    private String denyReason;

    @ApiModelProperty(value = "删除状态：0->未删除；1->已删除")
    private Integer deleteStatus;

    @ApiModelProperty(value = "发货时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime deliveryTime;

    @ApiModelProperty(value = "确认收货时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime receiveTime;

    @ApiModelProperty(value = "修改时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime modifyTime;

    @ApiModelProperty(value = "提交时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    private static final long serialVersionUID = 1L;


    public OmsOrder(Long productId,
                    Long memberId,
                    String memberUsername,
                    Long adminId,
                    String wechatAccount,
                    String receiverName,
                    String receiverPhone,
                    String receiverDetailAddress) {
        this.productId = productId;
        this.memberId = memberId;
        this.memberUsername = memberUsername;
        this.adminId = adminId;
        this.wechatAccount = wechatAccount;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
        this.receiverDetailAddress = receiverDetailAddress;
        this.sourceType = 2;
        this.status = OrderConstant.ORDER_TO_BE_CONFIRMED;
        this.deleteStatus = CommonConstant.NOT_DELETED;
        this.createTime = DateUtils.getCurrentTime();
        this.modifyTime = this.createTime;
    }

    public void updateTime() {
        this.modifyTime = DateUtils.getCurrentTime();
    }

}