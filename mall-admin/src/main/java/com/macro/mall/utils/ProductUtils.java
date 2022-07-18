package com.macro.mall.utils;

import com.macro.mall.common.utils.DateUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/17 22:16
 * @desc 产品工具类
 */
public class ProductUtils {
    /**
     * 生成sku码
     *
     * @param productId
     * @param order
     * @return
     */
    public static String getSkuCode(Long productId, int order) {
        StringBuilder sb = new StringBuilder();
        //日期
        String formateDate = DateUtils.formatTime(DateUtils.getCurrentTime());
        sb.append(formateDate);
        //四位商品id
        sb.append(String.format("%04d", productId));
        //三位索引id
        sb.append(String.format("%03d", order + 1));
        return sb.toString();
    }

    /**
     * 生成productsn码
     *
     * @return
     */
    public static String getProductSn() {
        String productSn = UUID.randomUUID().toString().replaceAll("-", "");
        return productSn;
    }
}
