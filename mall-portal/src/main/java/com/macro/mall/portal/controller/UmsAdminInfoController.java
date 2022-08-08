package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.domain.vo.UmsAdminInfoResponse;
import com.macro.mall.portal.service.UmsAdminService;
import com.macro.mall.portal.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * 后台用户管理Controller
 * Created by macro on 2018/4/26.
 */
@RestController
@Api(tags = "团长信息查询", description = "团长信息查询")
@RequestMapping("/admin/info")
public class UmsAdminInfoController {
    @Autowired
    private UmsAdminService adminService;
    @Autowired
    private CommonService commonService;

    @ApiOperation(value = "获取当前登录用户业务信息")
    @RequestMapping(value = "/business", method = RequestMethod.GET)
    public CommonResult getAdminBusinessInfo(@RequestParam("inviteCode") String inviteCode,
                                             Principal principal) {
        commonService.checkLoginUser(principal);
        UmsAdminInfoResponse adminInfo = adminService.getAdminInfo(inviteCode);
        if (adminInfo != null) {
            return CommonResult.success(adminInfo);
        }
        return CommonResult.failed();
    }

}
