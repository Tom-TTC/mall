package com.macro.mall.common.api;

import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.springframework.data.domain.Page;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 分页数据封装类
 * Created by macro on 2019/4/19.
 */
public class CommonPage<T> {
    /**
     * 当前页码
     */
    private Integer pageNum;
    /**
     * 每页数量
     */
    private Integer pageSize;
    /**
     * 总页数
     */
    private Integer totalPage;
    /**
     * 总条数
     */
    private Long total;
    /**
     * 分页数据
     */
    private List<T> list;

    /**
     * 将PageHelper分页后的list转为分页信息
     */
    public static <T> CommonPage<T> restPage(List<T> list) {
        CommonPage<T> result = new CommonPage<T>();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        result.setTotalPage(pageInfo.getPages());
        result.setPageNum(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        result.setList(pageInfo.getList());
        return result;
    }

    /**
     * 将PageHelper分页后的list转为分页信息
     */
    public static <T, R> CommonPage<R> restPage(List<T> list, Function<T, R> function) {
        CommonPage<R> result = new CommonPage<R>();
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        result.setTotalPage(pageInfo.getPages());
        result.setPageNum(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        if (!CollectionUtils.isEmpty(pageInfo.getList())) {
            List<R> resultList = pageInfo.getList().stream()
                    .map(function)
                    .collect(Collectors.toList());
            result.setList(resultList);
        } else {
            result.setList(Lists.newArrayList());
        }
        return result;
    }

    /**
     * 将SpringData分页后的list转为分页信息
     */
    public static <T> CommonPage<T> restPage(Page<T> pageInfo) {
        CommonPage<T> result = new CommonPage<T>();
        result.setTotalPage(pageInfo.getTotalPages());
        result.setPageNum(pageInfo.getNumber());
        result.setPageSize(pageInfo.getSize());
        result.setTotal(pageInfo.getTotalElements());
        result.setList(pageInfo.getContent());
        return result;
    }

    /**
     * 将SpringData分页后的list转为分页信息
     */
    public static <T, R> CommonPage<R> restPage(Page<T> pageInfo, Function<T, R> function) {
        CommonPage<R> result = new CommonPage<R>();
        result.setTotalPage(pageInfo.getTotalPages());
        result.setPageNum(pageInfo.getNumber());
        result.setPageSize(pageInfo.getSize());
        result.setTotal(pageInfo.getTotalElements());
        if (!CollectionUtils.isEmpty(pageInfo.getContent())) {
            List<R> resultList = pageInfo.getContent().stream()
                    .map(function)
                    .collect(Collectors.toList());
            result.setList(resultList);
        } else {
            result.setList(Lists.newArrayList());
        }
        return result;
    }

    /**
     * @param pageInfo
     * @param <T>
     * @return
     */
    public static <T> CommonPage<T> restPage(com.github.pagehelper.PageInfo<T> pageInfo) {
        CommonPage<T> result = new CommonPage<T>();
        result.setTotalPage(pageInfo.getPages());
        result.setPageNum(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        result.setList(pageInfo.getList());
        return result;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
