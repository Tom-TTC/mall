package com.macro.mall.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.macro.mall.common.utils.DateUtils;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class UmsMemberFavoriteProductBack implements Serializable {
    @ApiModelProperty(value = "id")
    private Long id;

    @ApiModelProperty(value = "会员id")
    private Long memberId;

    @ApiModelProperty(value = "商品id")
    private Long productId;

    @ApiModelProperty(value = "团长id")
    private Long adminId;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", locale = "zh", timezone = "GMT+8")
    private LocalDateTime createTime;

    public UmsMemberFavoriteProductBack(Long memberId, Long productId, Long adminId) {
        this.memberId = memberId;
        this.productId = productId;
        this.adminId = adminId;
        this.createTime= DateUtils.getCurrentTime();
    }
}