package com.macro.mall.portal.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.macro.mall.model.PmsProductCategory;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * 包含子级分类的商品分类
 * Created by macro on 2018/5/25.
 */
@Data
@EqualsAndHashCode(callSuper=false)
@JsonInclude(value = JsonInclude.Include.NON_NULL)
public class PmsProductCategoryWithChildrenItem extends PmsProductCategory {
    @ApiModelProperty("子级分类")
    private List<PmsProductCategory> children;
}
