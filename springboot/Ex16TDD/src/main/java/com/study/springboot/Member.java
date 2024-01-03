package com.study.springboot;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Builder
// @Builder : Lombok 어노테이션, 객체의 생성과 get/set을 연결하여 호출 가능
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private String loginId;
    private String loginPw;

}
