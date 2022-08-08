package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.common.domain.vo.MinioUploadDto;
import com.macro.mall.common.service.MinioUploadService;
import io.minio.MinioClient;
import io.minio.RemoveObjectArgs;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * MinIO对象存储管理Controller
 * Created by macro on 2019/12/25.
 */
@Api(tags = "文件上传", description = "MinIO对象存储管理")
@RestController
@RequestMapping("/minio")
public class MinioController {

    @Value("${minio.endpoint}")
    private String ENDPOINT;
    @Value("${minio.bucketName}")
    private String BUCKET_NAME;
    @Value("${minio.accessKey}")
    private String ACCESS_KEY;
    @Value("${minio.secretKey}")
    private String SECRET_KEY;
    @Autowired
    private MinioUploadService uploadService;

    @ApiOperation("文件上传")
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST)
    public CommonResult upload(@RequestParam("file") MultipartFile[] files) {
        List<MinioUploadDto> result = uploadService.uploadFiles(files);
        if (result != null) {
            return CommonResult.success(result);
        }
        return CommonResult.failed();
    }

    @ApiOperation("照片上传")
    @RequestMapping(value = "/img/upload", method = RequestMethod.POST)
    public CommonResult uploadPictures(@RequestParam("file") MultipartFile[] files) {
        List<MinioUploadDto> result = uploadService.uploadPictures(files);
        if (result != null) {
            return CommonResult.success(result);
        }
        return CommonResult.failed();
    }

    @ApiOperation("文件删除")
    @RequestMapping(value = "/file/delete", method = RequestMethod.POST)
    public CommonResult delete(@RequestParam("objectName") String objectName) {
        try {
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(ENDPOINT)
                    .credentials(ACCESS_KEY, SECRET_KEY)
                    .build();
            minioClient.removeObject(RemoveObjectArgs.builder().bucket(BUCKET_NAME).object(objectName).build());
            return CommonResult.success(null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return CommonResult.failed();
    }
}
