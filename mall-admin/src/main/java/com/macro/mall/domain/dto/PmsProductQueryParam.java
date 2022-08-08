package com.macro.mall.domain.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.Pattern;

/**
 * 商品查询参数
 * Created by macro on 2018/4/27.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class PmsProductQueryParam {
    @ApiModelProperty("上架状态")
    private Integer publishStatus;
    @ApiModelProperty("审核状态")
    private Integer verifyStatus;
    @ApiModelProperty("商品名称模糊关键字")
    private String keyword;
    @ApiModelProperty("商品货号")
    private String productSn;
    @ApiModelProperty("商品分类编号")
    private Long productCategoryId;

    @ApiModelProperty("开始时间")
    @Pattern(regexp = "/d{4}\\-/d{2}\\-/d{2} /d{2}:/d{2}:/d{2}", message = "日期格式错误")
    private String startTime;

    @ApiModelProperty("结尾时间")
    @Pattern(regexp = "/d{4}\\-/d{2}\\-/d{2} /d{2}:/d{2}:/d{2}", message = "日期格式错误")
    private String endTime;

    @ApiModelProperty(value = "团长id", hidden = true)
    private Long adminId;

    @ApiModelProperty(value = "排序字段,1->佣金 2->价格 3->最新上架，不传默认为时间排序")
    private Integer sort;

    @ApiModelProperty(value = "升序或降序，asc->升序，desc->降序")
    private String order;

    public String getOrder() {
        if(order==null||!order.equals("asc")){
            order="desc";
        }
        return order;
    }
}
