package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.model.SmsHomeAdvertise;
import com.macro.mall.portal.service.SmsHomeAdvertiseService;
import com.macro.mall.portal.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @ApiOperation("获取广告详情")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<SmsHomeAdvertise> getItem(@RequestParam(value = "inviteCode") String inviteCode,
                                                  @PathVariable Long id,
                                                  Principal principal) {
        commonService.checkLoginUser(principal);
        SmsHomeAdvertise advertise = advertiseService.getItem(id);
        if (advertise != null) {
            return CommonResult.success(advertise);
        }
        return CommonResult.failed(CommonConstant.AD_NOT_EXIST);
    }

    @ApiOperation("分页查询广告")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CommonPage<SmsHomeAdvertise>> list(@RequestParam(value = "inviteCode") String inviteCode,
                                                           @RequestParam(value = "name", required = false) String name,
                                                           @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                           @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                           Principal principal) {
        commonService.checkLoginUser(principal);
        List<SmsHomeAdvertise> advertiseList = advertiseService.list(inviteCode, name, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(advertiseList));
    }
}
