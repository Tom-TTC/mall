package com.macro.mall.domain.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/7/18 16:28
 * @desc ...
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class PmsProductVerifyParam extends PmsProductIds {

    @ApiModelProperty("审核状态")
    @NotNull(message = "审核状态不能为空")
    @Range(min = 0, max = 2, message = "审核状态无效")
    private Integer verifyStatus;

    @ApiModelProperty("审核意见")
    private String detail;
}
