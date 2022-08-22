package com.macro.mall.portal.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "wechat")
@Data
public class WechatConfig {
    /**
     * 微信appid
     */
    private String appId;

    /**
     * 微信appsecret
     */
    private String appSecret;

    /**
     * 微信服务器url
     */
    private String url;

}
