package com.study.springboot.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class ResultDto {
    String status;
    int result;
}