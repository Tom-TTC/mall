package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.api.Operation;
import com.macro.mall.domain.vo.UmsAdminInfoRequest;
import com.macro.mall.domain.vo.UmsAdminInfoResponse;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsInviteRecord;
import com.macro.mall.service.UmsAdminService;
import com.macro.mall.service.UmsRoleService;
import com.macro.mall.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

/**
 * 后台用户管理Controller
 * Created by macro on 2018/4/26.
 */
@RestController
@Api(tags = "后台用户信息管理", description = "后台用户信息管理")
@RequestMapping("/admin/info")
public class UmsAdminInfoController {
    @Autowired
    private UmsAdminService adminService;
    @Autowired
    private UmsRoleService roleService;
    @Autowired
    private CommonService commonService;

    @ApiOperation(value = "获取当前登录用户业务信息")
    @RequestMapping(value = "/business", method = RequestMethod.GET)
    public CommonResult getAdminBusinessInfo(Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        UmsAdminInfoResponse adminInfo = adminService.getAdminInfo(adminId);
        if (adminInfo != null) {
            return CommonResult.success(adminInfo);
        }
        return CommonResult.failed();
    }

    @ApiOperation(value = "创建用户业务信息")
    @RequestMapping(value = "/business", method = RequestMethod.POST)
    public CommonResult saveAdminBusinessInfo(@Validated({Operation.Creation.class}) @RequestBody UmsAdminInfoRequest request,
                                              Principal principal) {
        UmsAdmin umsAdmin = commonService.checkLoginUser(principal);
        request.setId(umsAdmin.getId());
        request.setUsername(umsAdmin.getUsername());
        Long adminInfoId = adminService.saveAdminInfo(request);
        if (adminInfoId != null) {
            return CommonResult.success(adminInfoId);
        }
        return CommonResult.failed();
    }

    @ApiOperation(value = "更新用户业务信息")
    @RequestMapping(value = "/business", method = RequestMethod.PUT)
    public CommonResult updateAdminBusinessInfo(@Validated({Operation.Update.class}) @RequestBody UmsAdminInfoRequest request,
                                                Principal principal) {
        UmsAdmin umsAdmin = commonService.checkLoginUser(principal);
        request.setId(umsAdmin.getId());
        request.setUsername(umsAdmin.getUsername());
        Long adminInfoId = adminService.updateAdminInfo(request);
        if (adminInfoId != null) {
            return CommonResult.success(adminInfoId);
        }
        return CommonResult.failed();
    }

    @ApiOperation(value = "积分充值")
    @RequestMapping(value = "/reward-point", method = RequestMethod.PUT)
    public CommonResult updateRewardPoint(@Validated({Operation.Update.class}) @RequestBody UmsAdminInfoRequest request,
                                          Principal principal) {
        UmsAdmin umsAdmin = commonService.checkLoginUser(principal);
        request.setId(umsAdmin.getId());
        request.setRewardPoint(request.getRewardPoint());
        Long adminInfoId = adminService.updateAdminRewardPoint(request);
        if (adminInfoId != null) {
            return CommonResult.success(adminInfoId);
        }
        return CommonResult.failed();
    }

    @ApiOperation(value = "分页获取邀请记录")
    @RequestMapping(value = "/invite-record", method = RequestMethod.GET)
    public CommonResult getInviteRecord(@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                        @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                        Principal principal) {
        Long adminId = commonService.getLoginUserId(principal);
        List<UmsInviteRecord> inviteRecords = adminService.getInviteRecord(adminId, pageNum, pageSize);
        if (inviteRecords != null) {
            return CommonResult.success(CommonPage.restPage(inviteRecords));
        }
        return CommonResult.failed();
    }

}
