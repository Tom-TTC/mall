package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.vo.OrderDetail;
import com.macro.mall.portal.domain.OrderParam;
import com.macro.mall.portal.service.OmsPortalOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 订单管理Controller
 * Created by macro on 2018/8/30.
 */
@RestController
@Api(tags = "订单管理", description = "订单管理")
@RequestMapping("/order")
public class OmsPortalOrderController {
    @Autowired
    private OmsPortalOrderService portalOrderService;


    @ApiOperation("创建订单")
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public CommonResult generateOrder(@Valid @RequestBody OrderParam orderParam) {
        String result = portalOrderService.generateOrder(orderParam);
        return CommonResult.success(result, "下单成功");
    }

    @ApiOperation("按状态分页获取用户订单列表")
    @ApiImplicitParam(name = "status", value = "订单状态：-1->全部；0->待确认；1->已寄件；2->已拒绝；3->已取消",
            defaultValue = "-1", allowableValues = "-1,0,1,2,3", paramType = "query", dataType = "int")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<OrderDetail>> list(@RequestParam(required = false, defaultValue = "-1") Integer status,
                                                      @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                      @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        CommonPage<OrderDetail> orderPage = portalOrderService.list(status, pageNum, pageSize);
        return CommonResult.success(orderPage);
    }

    @ApiOperation("根据ID获取订单详情")
    @RequestMapping(value = "/{orderSn}", method = RequestMethod.GET)
    public CommonResult<OrderDetail> detail(@PathVariable String orderSn) {
        OrderDetail orderDetail = portalOrderService.detail(orderSn);
        return CommonResult.success(orderDetail);
    }

    @ApiOperation("用户取消订单")
    @RequestMapping(value = "/", method = RequestMethod.PUT)
    public CommonResult cancelUserOrder(String orderSn) {
        portalOrderService.cancelOrder(orderSn);
        return CommonResult.success(null);
    }


    @ApiOperation("用户删除订单")
    @RequestMapping(value = "/{orderSn}", method = RequestMethod.DELETE)
    public CommonResult deleteOrder(@PathVariable String orderSn) {
        portalOrderService.deleteOrder(orderSn);
        return CommonResult.success(null);
    }
}
