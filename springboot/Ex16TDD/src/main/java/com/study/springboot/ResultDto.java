package com.study.springboot;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultDto {
    private String status; // "ok", "fail"
    private String message; // "로그인 성공했습니다."
}
