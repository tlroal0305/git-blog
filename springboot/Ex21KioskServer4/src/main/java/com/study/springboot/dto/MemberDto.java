package com.study.springboot.dto;


import com.study.springboot.entity.MemberEntity;
import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private Long memberNo;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberRole; //권한 "admin" "user"
    private Integer memberPoint;
    private LocalDateTime memberJoinDatetime; //가입일 "2023-10-12"

    public static MemberDto toMemberDto(MemberEntity entity){
        return MemberDto.builder()
                .memberNo(entity.getMemberNo())
                .memberId(entity.getMemberId())
                .memberPw(entity.getMemberPw())
                .memberName(entity.getMemberName())
                .memberRole(entity.getMemberRole())
                .memberPoint(entity.getMemberPoint())
                .memberJoinDatetime(entity.getMemberJoinDatetime())
                .build();
    }

}
