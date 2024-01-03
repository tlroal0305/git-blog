package com.study.springboot.dto;

import com.study.springboot.entity.MemberEntity;
import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDeleteDto {
    private Long memberNo;

    public static MemberDeleteDto toDto(MemberEntity entity){
        return MemberDeleteDto.builder()
            .memberNo(entity.getMemberNo())
            .build();
    }
}
