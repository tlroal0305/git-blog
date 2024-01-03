package com.study.springboot;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CKResponse {
    // 업로드한 이미지 개수
    private Integer uploaded;
    // 파일명 - 이미지 이름이 겹칠 수 있으니까 이름을 바꿔서 저장한다.
    private String fileName;
    // 이미지를 볼 수 있는 주소
    private String url;
}