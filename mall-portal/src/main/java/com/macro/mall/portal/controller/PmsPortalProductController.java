package com.macro.mall.portal.controller;

import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.UmsMemberFavoriteProduct;
import com.macro.mall.portal.domain.PmsProductCategoryNode;
import com.macro.mall.portal.domain.vo.PmsPortalProductDetail;
import com.macro.mall.portal.domain.vo.ProductFavRequest;
import com.macro.mall.portal.domain.vo.UmsMemberFavoriteProductResponse;
import com.macro.mall.portal.service.PmsPortalProductService;
import com.macro.mall.portal.service.impl.CommonService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

/**
 * 前台商品管理Controller
 * Created by macro on 2020/4/6.
 */
@RestController
@Api(tags = "前台商品管理", description = "前台商品管理")
@RequestMapping("/product")
public class PmsPortalProductController {

    @Autowired
    private PmsPortalProductService portalProductService;

    @Autowired
    private CommonService commonService;

    @ApiOperation(value = "搜索商品列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "sort", value = "排序字段:,1->佣金 2->价格 3->最新上架，不传默认为时间排序",
                    defaultValue = "3", allowableValues = "1,2,3", paramType = "query", dataType = "integer"),
            @ApiImplicitParam(name = "order", value = "升序或降序，asc->升序，desc->降序",
                    defaultValue = "desc", allowableValues = "asc,desc", paramType = "query", dataType = "string")})
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public CommonResult<CommonPage<PmsProduct>> search(@RequestParam String inviteCode,
                                                       @RequestParam(required = false) String keyword,
                                                       @RequestParam(required = false) Long productCategoryId,
                                                       @RequestParam(required = false, defaultValue = "1") Integer pageNum,
                                                       @RequestParam(required = false, defaultValue = "5") Integer pageSize,
                                                       @RequestParam(required = false, defaultValue = "1") Integer sort,
                                                       @RequestParam(required = false, defaultValue = "desc") String order) {
        List<PmsProduct> productList = portalProductService.search(keyword, inviteCode, productCategoryId, pageNum, pageSize, sort, order);
        return CommonResult.success(CommonPage.restPage(productList));
    }

    @ApiOperation("以树形结构获取所有商品分类")
    @RequestMapping(value = "/categoryTreeList", method = RequestMethod.GET)
    public CommonResult<List<PmsProductCategoryNode>> categoryTreeList() {
        List<PmsProductCategoryNode> list = portalProductService.categoryTreeList();
        return CommonResult.success(list);
    }

    @ApiOperation("通过id获取商品详情")
    @RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
    public CommonResult<PmsPortalProductDetail> detail(@PathVariable Long id) {
        PmsPortalProductDetail productDetail = portalProductService.detail(id);
        return CommonResult.success(productDetail);
    }

    @ApiOperation("收藏商品")
    @RequestMapping(value = "/fav", method = RequestMethod.POST)
    public CommonResult addToFav(@Valid @RequestBody ProductFavRequest request,
                                 Principal principal) {
        Long memberId = commonService.getLoginUserId(principal);
        request.setMemberId(memberId);
        long id = portalProductService.addToFav(request);
        if (id > 0) {
            return CommonResult.success(id);
        }
        return CommonResult.failed();
    }

    @ApiOperation("取消收藏商品")
    @RequestMapping(value = "/fav/{id}", method = RequestMethod.DELETE)
    public CommonResult<UmsMemberFavoriteProduct> cancelFav(@Valid @PathVariable Long id,
                                                            Principal principal) {
        Long memberId = commonService.getLoginUserId(principal);
        int count = portalProductService.cancelFav(id, memberId);
        if (count > 0) {
            return CommonResult.success(null, CommonConstant.OPERATE_SUCCESS);
        }
        return CommonResult.failed();
    }

    @ApiOperation("分页查询收藏商品")
    @RequestMapping(value = "/fav/list", method = RequestMethod.GET)
    public CommonResult<CommonPage<UmsMemberFavoriteProductResponse>> queryFavs(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                                                                                @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize,
                                                                                @RequestParam("inviteCode") String inviteCode,
                                                                                Principal principal) {
        Long memberId = commonService.getLoginUserId(principal);
        List<UmsMemberFavoriteProductResponse> favs = portalProductService.queryFavs(pageNum, pageSize, memberId, inviteCode);
        return CommonResult.success(CommonPage.restPage(favs));
    }


}
