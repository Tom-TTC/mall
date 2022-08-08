package com.macro.mall.utils;

import com.macro.mall.domain.bo.AdminUserDetails;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.exception.Asserts;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/17 21:24
 * @desc 获取登录用户信息
 */
public class LoginUtils {

    /**
     * 获取当前登录用户
     *
     * @return
     */
    public static AdminUserDetails getCurrentLoginUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        AdminUserDetails userDetails = (AdminUserDetails) authentication.getPrincipal();
        return userDetails;
    }

    /**
     * 获取当前登录用户id
     *
     * @return
     */
    public static Long getCurrentLoginUserId() {
        AdminUserDetails user = getCurrentLoginUser();
        if (user != null) {
            return getCurrentLoginUser().getUmsAdmin().getId();
        } else {
            Asserts.fail(CommonConstant.USER_UNLOGIN);
            return null;
        }
    }
}
