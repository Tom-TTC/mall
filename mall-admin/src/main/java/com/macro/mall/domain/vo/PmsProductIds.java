package com.macro.mall.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/18 19:11
 * @desc ...
 */
@Data
public class PmsProductIds {
    @ApiModelProperty("商品id数组")
    @NotNull(message = "数组不能为空")
    @Size(min = 1, message = "数组不能为空")
    private List<Long> ids;
}
