package com.macro.mall.common.domain;

import java.util.Random;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/16 12:20
 * @desc ...
 */
public interface CommonConstant {
    /**************************数字常量区********************************/
    int NUM_5 = 5;
    int NUM_10 = 10;
    int NUM_20 = 20;
    int NUM_0 = 0;
    int DELETED = 1;
    int NOT_DELETED = 0;
    /**************************符号常量区********************************/
    String SIGN_ENGLISH_COMMA = ",";
    String SIGN_CHINESE_COMMA = "，";

    /**************************字符串常量区********************************/
    String PRODUCT_PIC_LIMIT_5 = "商品主图最多5张";
    String PRODUCT_SKU_LIMIT_5 = "商品sku最多5个";

    String PRODUCT_CATEGORY_INVALID = "商品分类无效";

    String USER_UNLOGIN = "用户未登录或token过期";
    String USER_EXISTED = "用户已存在";

    String FILE_TYPE_NOT_MATCH = "上传文件类型错误";

    String INVITE_CODE_FAILED = "邀请码生成出错";

    String INVITE_CODE_ERROR = "邀请码无效";

    String POINT_NOT_ENOUGH = "积分不够，请联系客服进行充值";

    String FAVORITE_PRODUCT_ALREADY_ADDED = "产品已收藏，不可重复操作";

    String OPERATE_SUCCESS = "操作成功";

    String AD_NOT_EXIST = "广告不存在";

    /**************************其它********************************/
    Random random = new Random();

    int ADVERTISEMENT_FOR_APP = 1;
    int ADVERTISEMENT_FOR_PC = 0;

    /*************************************************************/
    long ROLE_TUANZHANG = 8;

}
