package com.macro.mall.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/18 16:28
 * @desc ...
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class PmsProductPublishParam extends PmsProductIds {


    @ApiModelProperty(value = "上架状态：0->下架；1->上架")
    @NotNull(message = "上架状态不能为空")
    @Range(min = 0, max = 1, message = "上架状态无效")
    private Integer publishStatus;

}
