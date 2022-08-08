package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.api.Operation;
import com.macro.mall.domain.vo.SmsHomeAdvertiseRequest;
import com.macro.mall.model.SmsHomeAdvertise;
import com.macro.mall.service.SmsHomeAdvertiseService;
import com.macro.mall.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

/**
 * 首页轮播广告管理Controller
 * Created by macro on 2018/11/7.
 */
@Controller
@Api(tags = "首页轮播广告管理", description = "首页轮播广告管理")
@RequestMapping("/home/advertise")
public class SmsHomeAdvertiseController {
    @Autowired
    private SmsHomeAdvertiseService advertiseService;

    @Autowired
    private CommonService commonService;

    @ApiOperation("添加广告")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult create(@Validated({Operation.Update.class}) @RequestBody SmsHomeAdvertiseRequest request,
                               Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        request.setAdminId(adminId);
        Long adId = advertiseService.create(request);
        if (adId > 0)
            return CommonResult.success(adId);
        return CommonResult.failed();
    }

    @ApiOperation("删除广告")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@RequestParam("ids") List<Long> ids, Principal principal) {
        commonService.checkLoginUser(principal);
        int count = advertiseService.delete(ids);
        if (count > 0)
            return CommonResult.success(count);
        return CommonResult.failed();
    }

    @ApiOperation("修改上下线状态")
    @RequestMapping(value = "/update/status/{id}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateStatus(@PathVariable Long id, Integer status, Principal principal) {
        commonService.checkLoginUser(principal);
        int count = advertiseService.updateStatus(id, status);
        if (count > 0)
            return CommonResult.success(count);
        return CommonResult.failed();
    }

    @ApiOperation("获取广告详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<SmsHomeAdvertise> getItem(@PathVariable Long id, Principal principal) {
        commonService.checkLoginUser(principal);
        SmsHomeAdvertise advertise = advertiseService.getItem(id);
        return CommonResult.success(advertise);
    }

    @ApiOperation("修改广告")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult update(@Validated({Operation.Update.class}) @RequestBody SmsHomeAdvertiseRequest request,
                               Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        request.setAdminId(adminId);
        int count = advertiseService.update(request);
        if (count > 0)
            return CommonResult.success(count);
        return CommonResult.failed();
    }

    @ApiOperation("分页查询广告")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<SmsHomeAdvertise>> list(@RequestParam(value = "name", required = false) String name,
                                                           @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                           @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                           Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        List<SmsHomeAdvertise> advertiseList = advertiseService.list(adminId, name, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(advertiseList));
    }
}
