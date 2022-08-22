package com.macro.mall.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "minio")
@Data
public class MinioConfig {
    /**
     * 文件服务器的url，包含端口
     */
    private String endpoint;

    /**
     * 返回的文件host，准备采用https试试
     */
    private String returnHost;

    /**
     * 桶名
     */
    private String bucketName;

    /**
     * 账号
     */
    private String accessKey;

    /**
     * 密码
     */
    private String secretKey;
}
