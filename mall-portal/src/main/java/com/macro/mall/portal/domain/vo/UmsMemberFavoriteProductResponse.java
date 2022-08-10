package com.macro.mall.portal.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class UmsMemberFavoriteProductResponse implements Serializable {
    @ApiModelProperty(value = "id")
    private Long id;

    @ApiModelProperty(value = "会员id")
    private Long memberId;

    @ApiModelProperty(value = "商品id")
    private Long productId;

    @ApiModelProperty(value = "商品名称")
    private String productName;

    @ApiModelProperty(value = "画册图片，连产品图片限制为5张，以逗号分割")
    private String albumPics;

    @ApiModelProperty(value = "商品价格")
    private BigDecimal productPrice;

    @ApiModelProperty(value = "商品价格")
    private Integer rebateRate;

    @ApiModelProperty(value = "商品上架状态，0->已下架，1->已上架")
    private Integer productPublishStatus;

    @ApiModelProperty(value = "团长id")
    private Long adminId;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    public UmsMemberFavoriteProductResponse(Long memberId, Long productId, Long adminId) {
        this.memberId = memberId;
        this.productId = productId;
        this.adminId = adminId;
        this.createTime= DateUtils.getCurrentTime();
    }
}