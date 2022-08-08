package com.macro.mall.portal.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.domain.OrderConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.utils.DateUtils;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.OmsOrderExample;
import com.macro.mall.model.UmsMember;
import com.macro.mall.model.vo.OrderDetail;
import com.macro.mall.portal.dao.PortalOrderDao;
import com.macro.mall.portal.domain.OrderParam;
import com.macro.mall.portal.domain.vo.PmsPortalProductDetail;
import com.macro.mall.portal.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 前台订单管理Service
 * Created by macro on 2018/8/30.
 */
@Service
public class OmsPortalOrderServiceImpl implements OmsPortalOrderService {
    @Autowired
    private UmsMemberService memberService;
    @Autowired
    private OmsCartItemService cartItemService;
    @Autowired
    private UmsMemberReceiveAddressService memberReceiveAddressService;
    @Autowired
    private UmsMemberCouponService memberCouponService;
    @Autowired
    private OmsOrderMapper orderMapper;
    @Autowired
    private PortalOrderDao portalOrderDao;
    @Autowired
    private PmsPortalProductService productService;

    @Override
    @Transactional
    public String generateOrder(OrderParam orderParam) {
        //获取购物车及优惠信息
        UmsMember currentMember = memberService.getCurrentMember();
        orderParam.setMemberId(currentMember.getId());
        orderParam.setMemberName(currentMember.getUsername());
        PmsPortalProductDetail productDetail = checkProduct(orderParam.getProductId());
        OmsOrder order = new OmsOrder(orderParam.getProductId(),
                orderParam.getMemberId(),
                orderParam.getMemberName(),
                productDetail.getCreateUserId(),
                orderParam.getWechatAccount(),
                orderParam.getReceiverName(),
                orderParam.getReceiverPhone(),
                orderParam.getReceiverAddress());
        String orderSn = generateOrderSn(order);
        order.setOrderSn(orderSn);
        orderMapper.insert(order);
        return order.getOrderSn();
    }

    /**
     * 判断商品是否存在
     *
     * @param productId
     */
    private PmsPortalProductDetail checkProduct(Long productId) {
        PmsPortalProductDetail productDetail = productService.detail(productId);
        return productDetail;
    }

    @Override
    @Transactional
    public void cancelOrder(String orderSn) {
        //查询待处理的订单
        OmsOrder cancelOrder = getOrderBySnWithCheck(orderSn);
        if (cancelOrder.getStatus() != OrderConstant.ORDER_TO_BE_CONFIRMED) {
            Asserts.fail(OrderConstant.ORDER_CAN_NOT_CANCEL);
        }
        //修改订单状态为取消
        cancelOrder.setStatus(OrderConstant.ORDER_CANCELLED);
        cancelOrder.updateTime();
        orderMapper.updateByPrimaryKeySelective(cancelOrder);
    }


    @Override
    public CommonPage<OrderDetail> list(Integer status, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<OrderDetail> orderList = portalOrderDao.getOrderList(memberService.getCurrentMemberId(), status);
        CommonPage<OrderDetail> orderPage = CommonPage.restPage(orderList);
        return orderPage;
    }

    @Override
    public OrderDetail detail(String orderSn) {
        //1.查询订单详情
        OmsOrder omsOrder = getOrderBySnWithCheck(orderSn);

        //2.填充订单基本信息
        OrderDetail orderDetail = new OrderDetail(omsOrder);

        //3.填充商品、店铺信息
        PmsPortalProductDetail productDetail = productService.detail(omsOrder.getProductId());

        orderDetail.setProductId(productDetail.getId())
                .setProductName(productDetail.getName())
                .setShopName(productDetail.getShopName());

        return orderDetail;
    }

    @Override
    @Transactional
    public void deleteOrder(String orderSn) {
        OmsOrder order = getOrderBySnWithCheck(orderSn);
        if (order.getStatus() == OrderConstant.ORDER_REFUSED
                || order.getStatus() == OrderConstant.ORDER_HANDLED
                || order.getStatus() == OrderConstant.ORDER_CANCELLED) {
            order.setDeleteStatus(1);
            order.updateTime();
            orderMapper.updateByPrimaryKey(order);
        } else {
            Asserts.fail(OrderConstant.ORDER_CAN_NOT_DELETE);
        }
    }

    /**
     * 通过orderSn查询当前登录用户未删除的订单：带校验，如果不存在，则报错
     *
     * @param orderSn
     * @return
     */
    private OmsOrder getOrderBySnWithCheck(String orderSn) {
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria()
                .andOrderSnEqualTo(orderSn)
                .andMemberIdEqualTo(memberService.getCurrentMemberId())
                .andDeleteStatusEqualTo(CommonConstant.NOT_DELETED);
        List<OmsOrder> orders = orderMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(orders)) {
            Asserts.fail(OrderConstant.ORDER_NOT_EXIST);
            return null;
        }
        return orders.get(0);
    }

    /**
     * 生成18位订单编号:固定一位前缀o+14位日期+用户id后5位（不足前面补0）+2位随机数
     */
    private String generateOrderSn(OmsOrder order) {
        String formateDate = DateUtils.SERIAL_TIME_PATTERN.format(DateUtils.getCurrentTime());
        StringBuilder sb = new StringBuilder("p");
        sb.append(formateDate);
        sb.append(String.format("%05d", order.getMemberId()).substring(0, 5));
        sb.append(String.format("%02d", CommonConstant.random.nextInt(10)));
        return sb.toString();
    }

}
