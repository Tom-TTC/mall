package com.macro.mall.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.api.Operation;
import com.macro.mall.domain.dto.PmsProductParam;
import com.macro.mall.domain.dto.PmsProductQueryParam;
import com.macro.mall.domain.vo.PmsProductIds;
import com.macro.mall.domain.vo.PmsProductPublishParam;
import com.macro.mall.domain.vo.PmsProductResponse;
import com.macro.mall.domain.vo.PmsProductVerifyParam;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.service.PmsProductService;
import com.macro.mall.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

/**
 * 商品管理Controller
 * Created by macro on 2018/4/26.
 */
@RestController
@Api(tags = "商品管理", description = "商品管理")
@RequestMapping("/product")
public class PmsProductController {
    @Autowired
    private PmsProductService productService;

    @Autowired
    private CommonService commonService;

    @ApiOperation("创建商品")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult create(@Validated({Operation.Creation.class}) @RequestBody PmsProductParam productParam, Principal principal) {
        Long userId = commonService.getLoginUserId(principal);
        productParam.setCreateUserId(userId);
        long productId = productService.create(productParam);
        if (productId > 0) {
            return CommonResult.success(productId);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("根据商品id获取商品编辑信息")
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public CommonResult<PmsProductResponse> getUpdateInfo(@PathVariable Long id) {
        PmsProductResponse productResult = productService.getProductDetail(id);
        return CommonResult.success(productResult);
    }

    @ApiOperation("更新商品")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@Validated({Operation.Update.class}) @RequestBody PmsProductParam productParam, Principal principal) {
        Long userId = commonService.getLoginUserId(principal);
        productParam.setCreateUserId(userId);
        long productId = productService.update(productParam);
        if (productId > 0) {
            return CommonResult.success(productId);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("查询商品")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<PmsProduct>> getList(PmsProductQueryParam productQueryParam,
                                                        @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                        @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        List<PmsProduct> productList = productService.list(productQueryParam, pageSize, pageNum);
        return CommonResult.success(CommonPage.restPage(productList));
    }

    @ApiOperation("根据商品名称或货号模糊查询")
    @RequestMapping(value = "/simpleList", method = RequestMethod.GET)
    public CommonResult<List<PmsProduct>> getList(String keyword) {
        List<PmsProduct> productList = productService.list(keyword);
        return CommonResult.success(productList);
    }

    @ApiOperation("批量修改审核状态")
    @RequestMapping(value = "/update/verifyStatus", method = RequestMethod.POST)
    public CommonResult updateVerifyStatus(@Valid @RequestBody PmsProductVerifyParam verifyParam) {
        int count = productService.updateVerifyStatus(verifyParam);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("批量上下架商品")
    @RequestMapping(value = "/update/publishStatus", method = RequestMethod.POST)
    public CommonResult updatePublishStatus(@Valid @RequestBody PmsProductPublishParam publishParam) {
        int count = productService.updatePublishStatus(publishParam);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    //@ApiOperation("批量推荐商品")
    @RequestMapping(value = "/update/recommendStatus", method = RequestMethod.POST)
    public CommonResult updateRecommendStatus(@RequestParam("ids") List<Long> ids,
                                              @RequestParam("recommendStatus") Integer recommendStatus) {
        int count = productService.updateRecommendStatus(ids, recommendStatus);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    //@ApiOperation("批量设为新品")
    @RequestMapping(value = "/update/newStatus", method = RequestMethod.POST)
    public CommonResult updateNewStatus(@RequestParam("ids") List<Long> ids,
                                        @RequestParam("newStatus") Integer newStatus) {
        int count = productService.updateNewStatus(ids, newStatus);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }

    @ApiOperation("批量修改删除状态")
    @RequestMapping(value = "/update/deleteStatus", method = RequestMethod.POST)
    public CommonResult updateDeleteStatus(@Valid @RequestBody PmsProductIds productIds) {
        int count = productService.updateDeleteStatus(productIds);
        if (count > 0) {
            return CommonResult.success(count);
        } else {
            return CommonResult.failed();
        }
    }
}
