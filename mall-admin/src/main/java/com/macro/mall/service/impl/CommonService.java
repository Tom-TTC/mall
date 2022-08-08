package com.macro.mall.service.impl;

import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.domain.bo.AdminUserDetails;
import com.macro.mall.model.UmsAdmin;
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
    public UmsAdmin checkLoginUser(Principal principal) {
        if (principal == null) {
            Asserts.fail(CommonConstant.USER_UNLOGIN);
        }
        UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) principal;
        AdminUserDetails userDetails = (AdminUserDetails) authenticationToken.getPrincipal();
        return userDetails.getUmsAdmin();
    }

    public Long getLoginUserId(Principal principal) {
        if (principal == null) {
            Asserts.fail(CommonConstant.USER_UNLOGIN);
        }
        UsernamePasswordAuthenticationToken authenticationToken = (UsernamePasswordAuthenticationToken) principal;
        AdminUserDetails userDetails = (AdminUserDetails) authenticationToken.getPrincipal();
        return userDetails.getUmsAdmin().getId();
    }


}
