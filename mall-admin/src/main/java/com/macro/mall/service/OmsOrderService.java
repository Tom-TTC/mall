package com.macro.mall.service;

import com.macro.mall.domain.dto.*;
import com.macro.mall.model.vo.OrderDetail;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单管理Service
 * Created by macro on 2018/10/11.
 */
public interface OmsOrderService {
    /**
     * 订单查询
     */
    List<OrderDetail> list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum);

    /**
     * 批量发货
     */
    @Transactional
    int handle(OmsOrderHandleParam handleParam);


    /**
     * 批量删除订单
     */
    int delete(List<String> orderSns);

    /**
     * 获取指定订单详情
     */
    OrderDetail detail(String orderSn);

    /**
     * 修改订单收货人信息
     */
    @Transactional
    int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam);

    /**
     * 修改订单备注
     */
    @Transactional
    int updateNote( OmsOrderNoteParam noteParam);
}
