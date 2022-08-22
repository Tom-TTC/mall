package com.macro.mall.portal.domain.vo;

import lombok.Data;

@Data
public class WechatSession {
    /**
     * 微信用户openid
     */
    private String openid;

    /**
     * 微信用户session_key
     */
    private String session_key;
}
