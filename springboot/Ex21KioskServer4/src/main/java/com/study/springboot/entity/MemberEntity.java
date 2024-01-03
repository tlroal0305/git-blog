package com.study.springboot.entity;

import com.study.springboot.dto.JoinDto;
import com.study.springboot.dto.MemberDto;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;


//@Entity : DB 테이블과 1:1로 매칭
@Entity
@Table(name="member")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberEntity {
    @Id  //기본키로 설정
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_no")
    private Long memberNo;
    @Column(name = "member_id")
    private String memberId;
    @Column(name = "member_pw")
    private String memberPw;
    @Column(name = "member_name")
    private String memberName;
    @Column(name = "member_role")
    private String memberRole; //권한 "admin" "user"
    @Column(name = "member_point")
    private Integer memberPoint;
    @Column(name = "member_join_datetime")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime memberJoinDatetime; //가입일 "2023-10-12"

    public static MemberEntity toJoinEntity(JoinDto joinDto){
        return MemberEntity.builder()
            .memberNo(0L)
            .memberId(joinDto.getLoginId())
            .memberPw(joinDto.getLoginPw())
            .memberName(joinDto.getLoginNickname())
            .memberRole("ROLE_USER")
            .memberPoint(0)
            .memberJoinDatetime(LocalDateTime.now())
            .build();
    }

    public static MemberEntity toMemberEntity(MemberDto memberDto){
        return MemberEntity.builder()
                .memberNo(memberDto.getMemberNo())
                .memberId(memberDto.getMemberId())
                .memberPw(memberDto.getMemberPw())
                .memberName(memberDto.getMemberName())
                .memberRole(memberDto.getMemberRole())
                .memberJoinDatetime(memberDto.getMemberJoinDatetime())
                .memberPoint(memberDto.getMemberPoint())
                .build();
    }
}






