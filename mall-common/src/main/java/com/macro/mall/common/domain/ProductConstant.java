package com.macro.mall.common.domain;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/16 12:20
 * @desc ...
 */
public interface ProductConstant {
    /**************************数字常量区********************************/
    int DELETED = 1;
    int NOT_DELETED = 0;

    //上架状态
    int ONLINE = 1;
    //下架状态
    int NOT_ONLINE = 0;

    int NOT_VARIFIED = 0;
    int VARIFIED_OK = 1;
    int VARIFIED_FALIED = 2;


    /**************************符号常量区********************************/

    /**************************字符串常量区********************************/
    String PRODUCT_NOT_EXISTED = "商品不存在";
    String PRODUCT_OPERATE_FAILED = "操作失败";

}
