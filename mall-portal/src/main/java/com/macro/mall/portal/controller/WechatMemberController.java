package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.portal.domain.vo.UmsMemberPasswordRequest;
import com.macro.mall.portal.domain.vo.WechatLoginParam;
import com.macro.mall.portal.domain.vo.WechatToken;
import com.macro.mall.portal.service.UmsMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * 会员登录注册管理Controller
 * Created by macro on 2018/8/3.
 */
@RestController
@Api(tags = "微信会员登录", description = "微信会员登录")
@RequestMapping("/wechat")
public class WechatMemberController {

    @Autowired
    private UmsMemberService memberService;

    @ApiOperation("会员登录")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public CommonResult<WechatToken> login(@Validated @RequestBody WechatLoginParam loginParam) {
        WechatToken token = memberService.login(loginParam);
        return CommonResult.success(token);
    }
}
