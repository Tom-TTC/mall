package com.macro.mall.common.domain;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/20 14:16
 * @desc ...
 */
public interface OrderConstant {
    /**
     * 待确认
     */
    int ORDER_TO_BE_CONFIRMED = 0;
    /**
     * 已处理 已寄件
     */
    int ORDER_HANDLED = 1;

    /**
     * 已拒绝
     */
    int ORDER_REFUSED = 2;

    /**
     * 已取消
     */
    int ORDER_CANCELLED = 3;

    /*******************************************************************/
    String ORDER_NOT_EXIST = "订单不存在";
    String ORDER_CAN_NOT_CANCEL = "订单状态不支持取消";

    String ORDER_CAN_NOT_DELETE = "订单状态不支持删除";

    String ORDER_NOT_EXIST_OR_INVALID = "订单不存在或状态不可操作";

    String DELIVERY_SN_INVALID = "寄样快递号不能为空";
    String DENY_REASON_INVALID = "拒绝原因不能为空";

    String DENY_DELIVERY = "拒绝寄样";
    String ACCEPT_DELIVERY = "同意寄样";

    String UPDATE_RECEIVER_INFO = "更新收货人信息";

    String UPDATE_ORDER_NOTE = "更新订单备注";
}
