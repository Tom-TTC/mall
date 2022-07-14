package com.macro.mall.common.service.impl;

import com.macro.mall.common.api.RedisTable;
import com.macro.mall.common.service.RedisService;
import com.macro.mall.common.service.TTCRedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/13 18:46
 * @desc ...
 */
@Service
public class TTCRedisServiceImpl implements TTCRedisService {
    //第一段key前缀
    @Value("${redis.database}")
    private String REDIS_DATABASE;

    @Autowired
    private RedisService redisService;

    private String getKey(RedisTable redisTable, String key) {
        return REDIS_DATABASE + ":" + redisTable.getKeyPrefix() + ":" + key;
    }


    /**
     * 保存属性
     *
     * @param redisTable
     * @param key
     * @param value
     * @param time
     */
    @Override
    public void set(RedisTable redisTable, String key, Object value, long time) {
        String fullKey = getKey(redisTable, key);
        redisService.set(fullKey, value, time);
    }

    /**
     * 保存属性
     *
     * @param redisTable
     * @param key
     * @param value
     */
    @Override
    public void set(RedisTable redisTable, String key, Object value) {
        String fullKey = getKey(redisTable, key);
        redisService.set(fullKey, value);
    }

    /**
     * 获取属性
     *
     * @param redisTable
     * @param key
     */
    @Override
    public Object get(RedisTable redisTable, String key) {
        String fullKey = getKey(redisTable, key);
        return redisService.get(fullKey);
    }

    /**
     * 删除属性
     *
     * @param redisTable
     * @param key
     */
    @Override
    public Boolean del(RedisTable redisTable, String key) {
        String fullKey = getKey(redisTable, key);
        return redisService.del(fullKey);
    }

    /**
     * 批量删除属性
     *
     * @param keys
     */
    @Override
    public Long del(RedisTable redisTable, List<String> keys) {
        List<String> fullKeys = keys.stream()
                .map(key -> getKey(redisTable, key))
                .collect(Collectors.toList());
        return redisService.del(fullKeys);
    }

    /**
     * 设置过期时间
     *
     * @param redisTable
     * @param key
     * @param time
     */
    @Override
    public Boolean expire(RedisTable redisTable, String key, long time) {
        String fullKey = getKey(redisTable, key);
        return redisService.expire(fullKey, time);
    }

    /**
     * 获取过期时间
     *
     * @param redisTable
     * @param key
     */
    @Override
    public Long getExpire(RedisTable redisTable, String key) {
        String fullKey = getKey(redisTable, key);
        return redisService.getExpire(fullKey);
    }

    /**
     * 判断是否有该属性
     *
     * @param redisTable
     * @param key
     */
    @Override
    public Boolean hasKey(RedisTable redisTable, String key) {
        String fullKey = getKey(redisTable, key);
        return redisService.hasKey(fullKey);
    }

    /**
     * 按delta递增
     *
     * @param redisTable
     * @param key
     * @param delta
     */
    @Override
    public Long incr(RedisTable redisTable, String key, long delta) {
        String fullKey = getKey(redisTable, key);
        return redisService.incr(fullKey, delta);
    }
}
