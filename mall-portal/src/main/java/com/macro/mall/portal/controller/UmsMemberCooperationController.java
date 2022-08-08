package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsCooperationRequest;
import com.macro.mall.portal.domain.vo.UmsCooperationParam;
import com.macro.mall.portal.service.UmsCooperationService;
import com.macro.mall.portal.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
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

    @ApiOperation("发起申请")
    @RequestMapping(value = "", method = RequestMethod.POST)
    public CommonResult<Long> addCooperation(@Valid @RequestBody UmsCooperationParam cooperationParam,
                                             Principal principal) {
        Long memberId = commonService.getLoginUserId(principal);
        cooperationParam.setMemberId(memberId);
        long id = cooperationService.create(cooperationParam);
        if (id > 0) {
            return CommonResult.success(id);
        }
        return CommonResult.failed();
    }

    @ApiOperation("查看申请")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public CommonResult<List<UmsCooperationRequest>> getCooperationList(@RequestParam("inviteCode") String inviteCode,
                                                                        Principal principal) {
        Long memberId = commonService.getLoginUserId(principal);
        List<UmsCooperationRequest> requests = cooperationService.queryCooperations(memberId, inviteCode);
        return CommonResult.success(requests);
    }

}
