package com.study.springboot.dto;

import com.study.springboot.entity.MemberEntity;
import com.study.springboot.entity.OrderEntity;
import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class JoinDto {
    private String loginId;
    private String loginPw;
    private String loginNickname;

    public static JoinDto toJoinDto(MemberEntity entity){
        return JoinDto.builder()
            .loginId(entity.getMemberId())
            .loginPw(entity.getMemberPw())
            .loginNickname(entity.getMemberName())
            .build();
    }
}
