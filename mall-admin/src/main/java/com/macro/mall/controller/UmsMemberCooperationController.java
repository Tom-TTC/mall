package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.service.UmsCooperationService;
import com.macro.mall.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

/**
 * 会员登录注册管理Controller
 * Created by macro on 2018/8/3.
 */
@RestController
@Api(tags = "合作申请", description = "合作申请")
@RequestMapping("/member/cooperation")
public class UmsMemberCooperationController {
    @Autowired
    private CommonService commonService;

    @Autowired
    private UmsCooperationService cooperationService;


    @ApiOperation("根据id查看合作请求")
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public CommonResult<UmsCooperationRequest> getCooperation(@PathVariable Long id,
                                                              Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        UmsCooperationRequest result = cooperationService.getCooperationById(id, adminId);
        return CommonResult.success(result);
    }

    @ApiOperation("查看申请列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<UmsCooperationRequest>> getCooperationList(@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                                              @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                                                              Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        List<UmsCooperationRequest> result = cooperationService.queryCooperations(pageNum, pageSize, adminId);
        return CommonResult.success(CommonPage.restPage(result));
    }

}
