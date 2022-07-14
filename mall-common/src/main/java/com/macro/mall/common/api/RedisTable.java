package com.macro.mall.common.api;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/13 17:41
 * @desc ...
 */
public enum RedisTable {
    UmsAdmin("ums:admin","后台用户信息"),
    UmsResourceList("ums:resourceList","后台资源列表"),
    UmsAdminToken("ums:token","后台用户token"),
    UmsAdminUserToken("ums:user-token","后台用户与token对应关系"),

    UmsAuthCode("ums:authCode","验证码"),
    UmsMember("ums:member","订单id"),

    OmsOrderId("oms:orderId","订单id"),

    ;

    RedisTable(String keyPrefix, String desc) {
        this.keyPrefix = keyPrefix;
        this.desc = desc;
    }

    private String keyPrefix;
    private String desc;

    public String getKeyPrefix() {
        return keyPrefix;
    }
}
