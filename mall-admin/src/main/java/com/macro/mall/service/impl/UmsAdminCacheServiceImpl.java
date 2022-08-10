package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.macro.mall.common.api.RedisTable;
import com.macro.mall.common.service.TTCRedisService;
import com.macro.mall.dao.UmsAdminRoleRelationDao;
import com.macro.mall.mapper.UmsAdminRoleRelationMapper;
import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsAdminRoleRelation;
import com.macro.mall.model.UmsAdminRoleRelationExample;
import com.macro.mall.model.UmsResource;
import com.macro.mall.service.UmsAdminCacheService;
import com.macro.mall.service.UmsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 后台用户缓存操作Service实现类
 * Created by macro on 2020/3/13.
 */
@Service
public class UmsAdminCacheServiceImpl implements UmsAdminCacheService {
    @Autowired
    private UmsAdminService adminService;
    @Autowired
    private TTCRedisService ttcRedisService;
    @Autowired
    private UmsAdminRoleRelationMapper adminRoleRelationMapper;
    @Autowired
    private UmsAdminRoleRelationDao adminRoleRelationDao;

    @Value("${redis.expire.common}")
    private Long REDIS_EXPIRE;


    @Override
    public void delAdmin(Long adminId) {
        UmsAdmin admin = adminService.getItem(adminId);
        if (admin != null) {
            ttcRedisService.del(RedisTable.UmsAdmin, admin.getUsername());
        }
    }

    @Override
    public void delResourceList(Long adminId) {
        ttcRedisService.del(RedisTable.UmsResourceList, adminId + "");
    }

    @Override
    public void delResourceListByRole(Long roleId) {
        UmsAdminRoleRelationExample example = new UmsAdminRoleRelationExample();
        example.createCriteria().andRoleIdEqualTo(roleId);
        List<UmsAdminRoleRelation> relationList = adminRoleRelationMapper.selectByExample(example);
        if (CollUtil.isNotEmpty(relationList)) {
            List<String> keys = relationList.stream()
                    .map(r -> r.getAdminId() + "")
                    .collect(Collectors.toList());
            ttcRedisService.del(RedisTable.UmsResourceList, keys);
        }
    }

    @Override
    public void delResourceListByRoleIds(List<Long> roleIds) {
        UmsAdminRoleRelationExample example = new UmsAdminRoleRelationExample();
        example.createCriteria().andRoleIdIn(roleIds);
        List<UmsAdminRoleRelation> relationList = adminRoleRelationMapper.selectByExample(example);
        if (CollUtil.isNotEmpty(relationList)) {
            List<String> keys = relationList.stream()
                    .map(r -> r.getAdminId() + "")
                    .collect(Collectors.toList());
            ttcRedisService.del(RedisTable.UmsResourceList, keys);

        }
    }

    @Override
    public void delResourceListByResource(Long resourceId) {
        List<Long> adminIdList = adminRoleRelationDao.getAdminIdList(resourceId);
        if (CollUtil.isNotEmpty(adminIdList)) {
            List<String> keys = adminIdList.stream()
                    .map(String::valueOf)
                    .collect(Collectors.toList());
            ttcRedisService.del(RedisTable.UmsResourceList, keys);
        }
    }

    @Override
    public UmsAdmin getAdmin(String username) {
        return (UmsAdmin) ttcRedisService.get(RedisTable.UmsAdmin, username);
    }

    @Override
    public void setAdmin(UmsAdmin admin) {
        ttcRedisService.set(RedisTable.UmsAdmin, admin.getUsername(), admin, REDIS_EXPIRE);
    }

    @Override
    public List<UmsResource> getResourceList(Long adminId) {
        return (List<UmsResource>) ttcRedisService.get(RedisTable.UmsResourceList, adminId + "");
    }

    @Override
    public void setResourceList(Long adminId, List<UmsResource> resourceList) {
        ttcRedisService.set(RedisTable.UmsResourceList, adminId + "", resourceList, REDIS_EXPIRE);
    }
}
