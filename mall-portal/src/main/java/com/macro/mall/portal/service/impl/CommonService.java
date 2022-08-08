package com.macro.mall.portal.service.impl;

import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.domain.MemberDetails;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

import java.security.Principal;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/19 11:15
 * @desc ...
 */
@Service
public class CommonService {

    /**
     * 校验当前登录用户
     *
     * @param principal
     * @return
     */
    public UmsMember checkLoginUser(Principal principal) {
        if (principal == null) {
            Asserts.fail(CommonConstant.USER_UNLOGIN);
        }
        UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) principal;
        MemberDetails memberDetails = (MemberDetails) authenticationToken.getPrincipal();
        return memberDetails.getUmsMember();
    }

    public Long getLoginUserId(Principal principal) {
        if (principal == null) {
            Asserts.fail(CommonConstant.USER_UNLOGIN);
        }
        UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) principal;
        MemberDetails memberDetails = (MemberDetails) authenticationToken.getPrincipal();
        return memberDetails.getUmsMember().getId();
    }


}
