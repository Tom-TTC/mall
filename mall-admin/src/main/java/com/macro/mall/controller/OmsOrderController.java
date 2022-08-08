package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.domain.dto.*;
import com.macro.mall.model.vo.OrderDetail;
import com.macro.mall.service.OmsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 订单管理Controller
 * Created by macro on 2018/10/11.
 */
@RestController
@Api(tags = "订单管理", description = "订单管理")
@RequestMapping("/order")
public class OmsOrderController {
    @Autowired
    private OmsOrderService orderService;

    @ApiOperation("查询订单")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<OrderDetail>> list(OmsOrderQueryParam queryParam,
                                                      @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                      @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<OrderDetail> orderList = orderService.list(queryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(orderList));
    }

    @ApiOperation("同意或拒绝寄样")
    @RequestMapping(value = "/update/delivery", method = RequestMethod.POST)
    public CommonResult delivery(@Valid @RequestBody OmsOrderHandleParam handleParam) {
        int count = orderService.handle(handleParam);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("批量删除订单")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public CommonResult delete(@RequestParam("orderSns") List<String> orderSns) {
        int count = orderService.delete(orderSns);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取订单详情")
    @RequestMapping(value = "/{orderSn}", method = RequestMethod.GET)
    public CommonResult<OrderDetail> detail(@PathVariable String orderSn) {
        OrderDetail orderDetail = orderService.detail(orderSn);
        return CommonResult.success(orderDetail);
    }

    @ApiOperation("修改收货人信息")
    @RequestMapping(value = "/update/receiverInfo", method = RequestMethod.POST)
    public CommonResult updateReceiverInfo(@Valid @RequestBody OmsReceiverInfoParam receiverInfoParam) {
        int count = orderService.updateReceiverInfo(receiverInfoParam);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("备注订单")
    @RequestMapping(value = "/update/note", method = RequestMethod.POST)
    public CommonResult updateNote(@Valid @RequestBody OmsOrderNoteParam noteParam) {
        int count = orderService.updateNote(noteParam);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}
