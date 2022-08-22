package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.domain.vo.UmsMemberHeadRequest;
import com.macro.mall.portal.domain.vo.UmsMemberInfo;
import com.macro.mall.portal.domain.vo.UmsMemberPhoneRequest;
import com.macro.mall.portal.service.UmsMemberService;
import com.macro.mall.portal.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.security.Principal;

/**
 * 会员登录注册管理Controller
 * Created by macro on 2018/8/3.
 */
@RestController
@Api(tags = "会员信息管理", description = "会员信息管理")
@RequestMapping("/member")
public class UmsMemberInfoController {
    @Autowired
    private UmsMemberService memberService;
    @Autowired
    private CommonService commonService;

    @ApiOperation("获取会员信息")
    @RequestMapping(value = "/info", method = RequestMethod.GET)
    public CommonResult<UmsMemberInfo> info(Principal principal) {
        UmsMember umsMember = commonService.checkLoginUser(principal);
        UmsMemberInfo member = memberService.getMemberInfo(umsMember);
        return CommonResult.success(member);
    }

    @ApiOperation("会员头像上传")
    @RequestMapping(value = "/updateHeadIcon", method = RequestMethod.POST)
    public CommonResult updateHeadIcon(Principal principal,
                                       @Valid @RequestBody UmsMemberHeadRequest headRequest) {
        UmsMember umsMember = commonService.checkLoginUser(principal);
        memberService.updateHeadIcon(umsMember, headRequest);
        return CommonResult.success(null, "头像更新成功");
    }

    @ApiOperation("会员号码更新")
    @RequestMapping(value = "/updatePhone", method = RequestMethod.POST)
    public CommonResult updatePhone(Principal principal,
                                    @Valid @RequestBody UmsMemberPhoneRequest phoneRequest) {
        UmsMember umsMember = commonService.checkLoginUser(principal);
        memberService.updatePhone(umsMember, phoneRequest);
        return CommonResult.success(null, "手机号更新成功");
    }

}
