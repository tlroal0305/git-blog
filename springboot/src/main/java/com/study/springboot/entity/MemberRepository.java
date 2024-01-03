package com.study.springboot.entity;


import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
    //기본함수
    //확장함수
    //JPQL
    //Native Query

    // select * from member where member_id = ? and member_pw = ?
    List<MemberEntity> findByMemberIdAndMemberPw(String id, String pw);

    // select * form member where member_id = ?
    List<MemberEntity> findByMemberId(String id);

}
