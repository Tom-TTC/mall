package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.macro.mall.common.domain.OrderConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.utils.DateUtils;
import com.macro.mall.dao.OmsOrderDao;
import com.macro.mall.dao.OmsOrderOperateHistoryDao;
import com.macro.mall.domain.bo.AdminUserDetails;
import com.macro.mall.domain.dto.OmsOrderHandleParam;
import com.macro.mall.domain.dto.OmsOrderNoteParam;
import com.macro.mall.domain.dto.OmsOrderQueryParam;
import com.macro.mall.domain.dto.OmsReceiverInfoParam;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.mapper.OmsOrderOperateHistoryMapper;
import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.OmsOrderExample;
import com.macro.mall.model.OmsOrderOperateHistory;
import com.macro.mall.model.vo.OrderDetail;
import com.macro.mall.service.OmsOrderService;
import com.macro.mall.utils.LoginUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 订单管理Service实现类
 * Created by macro on 2018/10/11.
 */
@Service
public class OmsOrderServiceImpl implements OmsOrderService {
    @Autowired
    private OmsOrderMapper orderMapper;
    @Autowired
    private OmsOrderDao orderDao;
    @Autowired
    private OmsOrderOperateHistoryDao orderOperateHistoryDao;
    @Autowired
    private OmsOrderOperateHistoryMapper orderOperateHistoryMapper;

    @Override
    public List<OrderDetail> list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) {
        //1.填充管理员id（管理员只能查自己商铺的订单，后面超级管理员，再考虑方案）
        Long adminId = LoginUtils.getCurrentLoginUserId();
        queryParam.setAdminId(adminId);
        if (Objects.equals("4", queryParam.getStatus())) {
            queryParam.setStatus("2,3");
        } else if (Objects.equals("-1", queryParam.getStatus())) {
            queryParam.setStatus(null);
        }
        PageHelper.startPage(pageNum, pageSize);
        return orderDao.getOrderList(queryParam);
    }

    /**
     * 处理订单：同样寄样或者拒绝寄样
     *
     * @param handleParam
     * @return
     */
    @Override
    public int handle(OmsOrderHandleParam handleParam) {
        //订单当前状态必须是待处理
        handleParam.setCurrentStatusList(OrderConstant.ORDER_TO_BE_CONFIRMED + "");
        AdminUserDetails userDetails = checkAdminOrder(handleParam);
        if (OrderConstant.ORDER_HANDLED == handleParam.getOrderStatus()) {
            //如果同意，则快递编号不能为空
            if (StringUtils.isEmpty(handleParam.getDeliverySn())) {
                Asserts.fail(OrderConstant.DELIVERY_SN_INVALID);
            }
            handleParam.setDeliveryTime(DateUtils.getCurrentTime());
            handleParam.setDenyReason(null);
        } else if (OrderConstant.ORDER_REFUSED == handleParam.getOrderStatus()) {
            //如果拒绝，则拒绝原因不能为空
            if (StringUtils.isEmpty(handleParam.getDenyReason())) {
                Asserts.fail(OrderConstant.DENY_REASON_INVALID);
            }
            handleParam.setDeliveryCompany(null);
            handleParam.setDeliverySn(null);
        }
        //批量发货
        int count = orderDao.delivery(handleParam);
        //添加操作记录
        String note = handleParam.getOrderStatus() == OrderConstant.ORDER_HANDLED ? OrderConstant.ACCEPT_DELIVERY : OrderConstant.DENY_DELIVERY;
        logOrderOperation(handleParam.getOrderSn(), userDetails.getUsername(), handleParam.getOrderStatus(), note);
        return count;
    }

    /**
     * 校验管理员是否可以处理该订单
     *
     * @param handleParam
     */
    private AdminUserDetails checkAdminOrder(OmsOrderHandleParam handleParam) {
        AdminUserDetails userDetails = LoginUtils.getCurrentLoginUser();
        handleParam.setAdminId(userDetails.getUmsAdmin().getId());
        int orderCount = orderDao.countMyOrder(handleParam);
        if (orderCount == 0) {
            Asserts.fail(OrderConstant.ORDER_NOT_EXIST_OR_INVALID);
        }
        return userDetails;
    }

    /**
     * 做操作记录
     */
    private void logOrderOperation(String orderSn, String adminName, Integer orderStatus, String note) {
        OmsOrderOperateHistory history = new OmsOrderOperateHistory();
        history.setOrderSn(orderSn);
        history.setCreateTime(DateUtils.getCurrentTime());
        history.setOperateMan(adminName);
        history.setOrderStatus(orderStatus);
        history.setNote(note);
        orderOperateHistoryDao.insertList(Lists.newArrayList(history));
    }


    @Override
    public int delete(List<String> orderSns) {
        OmsOrderHandleParam handleParam = new OmsOrderHandleParam();
        String currentStatusList = Lists.newArrayList(OrderConstant.ORDER_CANCELLED, OrderConstant.ORDER_REFUSED, OrderConstant.ORDER_HANDLED)
                .stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
        handleParam.setCurrentStatusList(currentStatusList);
        checkAdminOrder(handleParam);

        OmsOrder record = new OmsOrder();
        record.setDeleteStatus(1);
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andOrderSnIn(orderSns);
        return orderMapper.updateByExampleSelective(record, example);
    }

    @Override
    public OrderDetail detail(String orderSn) {
        Long adminId = LoginUtils.getCurrentLoginUserId();
        OmsOrderQueryParam queryParam = new OmsOrderQueryParam()
                .setOrderSn(orderSn)
                .setAdminId(adminId);
        List<OrderDetail> orderDetails = orderDao.getOrderList(queryParam);
        if (CollectionUtils.isEmpty(orderDetails)) {
            Asserts.fail(OrderConstant.ORDER_NOT_EXIST);
        }
        return orderDetails.get(0);
    }

    @Override
    public int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam) {
        //1.校验管理员是否有该订单
        OmsOrderHandleParam handleParam = new OmsOrderHandleParam();
        String currentStatusList = Lists.newArrayList(OrderConstant.ORDER_TO_BE_CONFIRMED, OrderConstant.ORDER_HANDLED)
                .stream()
                .map(String::valueOf)
                .collect(Collectors.joining(","));
        handleParam.setCurrentStatusList(currentStatusList);
        handleParam.setOrderSn(receiverInfoParam.getOrderSn());
        AdminUserDetails user = checkAdminOrder(handleParam);

        //2.更新订单
        OmsOrderExample orderExample = new OmsOrderExample();
        orderExample.createCriteria()
                .andOrderSnEqualTo(receiverInfoParam.getOrderSn());
        OmsOrder order = new OmsOrder()
                .setReceiverName(receiverInfoParam.getReceiverName())
                .setReceiverPhone(receiverInfoParam.getReceiverPhone())
                .setReceiverDetailAddress(receiverInfoParam.getReceiverDetailAddress());
        order.updateTime();
        int count = orderMapper.updateByExampleSelective(order, orderExample);

        //3.插入操作记录
        logOrderOperation(receiverInfoParam.getOrderSn(), user.getUsername(), null, OrderConstant.UPDATE_RECEIVER_INFO);
        return count;
    }

    @Override
    public int updateNote(OmsOrderNoteParam noteParam) {
        //1.校验管理员是否有该订单
        OmsOrderHandleParam handleParam = new OmsOrderHandleParam();
        AdminUserDetails user = checkAdminOrder(handleParam);

        //2.更新订单
        OmsOrderExample orderExample = new OmsOrderExample();
        orderExample.createCriteria()
                .andOrderSnEqualTo(noteParam.getOrderSn());
        OmsOrder order = new OmsOrder()
                .setNote(noteParam.getNote());
        order.updateTime();
        int count = orderMapper.updateByExampleSelective(order, orderExample);

        //3.插入操作记录
        logOrderOperation(noteParam.getOrderSn(), user.getUsername(), null, OrderConstant.UPDATE_ORDER_NOTE);
        return count;
    }

}
