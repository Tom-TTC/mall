package com.macro.mall.common.service;

import com.macro.mall.common.domain.vo.MinioUploadDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 上传文件
 */
public interface MinioUploadService {

    /**
     * 批量上传照片
     *
     * @param files
     * @return
     */
    List<MinioUploadDto> uploadPictures(MultipartFile[] files);

    /**
     * 批量上传照片
     *
     * @param files
     * @return
     */
    List<MinioUploadDto> uploadFiles(MultipartFile[] files);

}
