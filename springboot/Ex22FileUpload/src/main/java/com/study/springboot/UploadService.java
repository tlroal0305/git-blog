package com.study.springboot;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class UploadService {
    // 임시로 직접 만든 폴더를 연결해 준다.
    //@Value("c:/Temp/upload")
    @Value("${spring.servlet.multipart.location}")
    private String CKImageFolder;

    @Value("/upload/")
    private String ckImagepath;

    public CKResponse ckImageUpload(MultipartFile image){
        if (/* ★ 여기 순서 바뀌지 않도록 주의! */ image != null && image.isEmpty() == false) {
            // 파일명 바꾸기
            String imageName = UUID.randomUUID() + "-" + image.getOriginalFilename();

            // 하드디스크에 이미지를 저장할 파일을 생성
            File file = new File(CKImageFolder, imageName);

            // 이미지를 파일로 이동
            try {
                image.transferTo(file);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
            }
            return new CKResponse(1, imageName, ckImagepath + imageName);
        }
        return null;
    }
}