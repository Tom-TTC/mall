package com.macro.mall.common.service;

import com.macro.mall.common.api.RedisTable;

import java.util.List;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/13 18:43
 * @desc ...
 */
public interface TTCRedisService {
    /**
     * 保存属性
     */
    void set(RedisTable redisTable, String key, Object value, long time);

    /**
     * 保存属性
     */
    void set(RedisTable redisTable, String key, Object value);

    /**
     * 获取属性
     */
    Object get(RedisTable redisTable, String key);

    /**
     * 删除属性
     */
    Boolean del(RedisTable redisTable, String key);

    /**
     * 批量删除属性
     */
    Long del(RedisTable redisTable, List<String> keys);

    /**
     * 设置过期时间
     */
    Boolean expire(RedisTable redisTable, String key, long time);

    /**
     * 获取过期时间
     */
    Long getExpire(RedisTable redisTable, String key);

    /**
     * 判断是否有该属性
     */
    Boolean hasKey(RedisTable redisTable, String key);

    /**
     * 按delta递增
     */
    Long incr(RedisTable redisTable, String key, long delta);
}
