package com.macro.mall.common.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.json.JSONUtil;
import com.google.common.collect.Lists;
import com.macro.mall.common.domain.BucketPolicyConfigDto;
import com.macro.mall.common.domain.CommonConstant;
import com.macro.mall.common.domain.vo.MinioUploadDto;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.service.MinioUploadService;
import io.minio.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Slf4j
public class MinioUploadServiceImpl implements MinioUploadService {

    @Value("${minio.endpoint}")
    private String ENDPOINT;
    @Value("${minio.bucketName}")
    private String BUCKET_NAME;
    @Value("${minio.accessKey}")
    private String ACCESS_KEY;
    @Value("${minio.secretKey}")
    private String SECRET_KEY;

    @Value("#{'${img.type}'.split(',')}")
    private List<String> imgType;

    /**
     * 批量上传照片
     *
     * @param files
     * @return
     */
    @Override
    public List<MinioUploadDto> uploadPictures(MultipartFile[] files) {
        boolean allPicture = checkFileType(files, imgType);
        if (!allPicture) {
            Asserts.fail(CommonConstant.FILE_TYPE_NOT_MATCH);
        }
        return uploadFiles(files);
    }

    /**
     * @param files
     * @param fileTypes
     * @return true表示ok，false表示格式不对
     */
    private boolean checkFileType(MultipartFile[] files, List<String> fileTypes) {
        boolean noneMatch = false;
        for (MultipartFile file : files) {
            String fileName = file.getOriginalFilename();
            noneMatch = fileTypes.stream()
                    .noneMatch(type -> fileName.endsWith(type));
            if (noneMatch) {
                return false;
            }
        }
        return true;
    }

    /**
     * 批量上传照片
     *
     * @param files
     * @return
     */
    @Override
    public List<MinioUploadDto> uploadFiles(MultipartFile[] files) {
        try {
            //创建一个MinIO的Java客户端
            MinioClient minioClient = MinioClient.builder()
                    .endpoint(ENDPOINT)
                    .credentials(ACCESS_KEY, SECRET_KEY)
                    .build();
            boolean isExist = minioClient.bucketExists(BucketExistsArgs.builder().bucket(BUCKET_NAME).build());
            if (isExist) {
                log.info("存储桶已经存在！");
            } else {
                //创建存储桶并设置只读权限
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(BUCKET_NAME).build());
                BucketPolicyConfigDto bucketPolicyConfigDto = createBucketPolicyConfigDto(BUCKET_NAME);
                SetBucketPolicyArgs setBucketPolicyArgs = SetBucketPolicyArgs.builder()
                        .bucket(BUCKET_NAME)
                        .config(JSONUtil.toJsonStr(bucketPolicyConfigDto))
                        .build();
                minioClient.setBucketPolicy(setBucketPolicyArgs);
            }
            List<MinioUploadDto> multiUploadDtos = Lists.newArrayList();
            MinioUploadDto tempDto = null;
            for (MultipartFile file : files) {
                tempDto = updateSingleFile(file, minioClient);
                multiUploadDtos.add(tempDto);
            }
            return multiUploadDtos;
        } catch (Exception e) {
            e.printStackTrace();
            log.info("上传发生错误: {}！", e.getMessage());
        }
        return null;
    }

    /**
     * @param file
     * @param minioClient
     * @return
     * @throws Exception
     */
    private MinioUploadDto updateSingleFile(MultipartFile file, MinioClient minioClient) throws Exception {
        String filename = file.getOriginalFilename();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String fileSuffix = filename.substring(filename.lastIndexOf("."));
        // 设置存储对象名称
        //String objectName = sdf.format(new Date()) + "/" + filename;
        String objectName = sdf.format(new Date()) + "/" + UUID.randomUUID().toString().replaceAll("-", "") + fileSuffix;
        // 使用putObject上传一个文件到存储桶中
        PutObjectArgs putObjectArgs = PutObjectArgs.builder()
                .bucket(BUCKET_NAME)
                .object(objectName)
                .contentType(file.getContentType())
                .stream(file.getInputStream(), file.getSize(), ObjectWriteArgs.MIN_MULTIPART_SIZE)
                .build();
        minioClient.putObject(putObjectArgs);
        log.info("文件上传成功!");
        MinioUploadDto minioUploadDto = new MinioUploadDto();
        minioUploadDto.setName(filename);
        minioUploadDto.setUrl(ENDPOINT + "/" + BUCKET_NAME + "/" + objectName);
        return minioUploadDto;
    }

    private BucketPolicyConfigDto createBucketPolicyConfigDto(String bucketName) {
        BucketPolicyConfigDto.Statement statement = BucketPolicyConfigDto.Statement.builder()
                .Effect("Allow")
                .Principal("*")
                .Action("s3:GetObject")
                .Resource("arn:aws:s3:::" + bucketName + "/*.**").build();
        return BucketPolicyConfigDto.builder()
                .Version("2012-10-17")
                .Statement(CollUtil.toList(statement))
                .build();
    }
}
