package com.study.springboot;

import org.springframework.data.jpa.repository.JpaRepository;

// Repository : 저장소, DB 테이블과 1:1 매칭
// extends : 상속받을 클래스
// JpaRepository 인터페이스 : 스프링 JPA에서 ENTITY(테이블)에 대한
//                            기본적인 조회, 삽입, 수정, 삭제가 가능하도록 만든 인터페이스
// 제네릭<ENTITY 클래스, PK 타입>
// 클래스 implements 인터페이스 : 일반 클래스에서 인터페이스 구현
// 인터페이스 extends 인터페이스 : 인터페이스 기능 확장
public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
    // JpaRepository의 기본 함수
    // 1. findAll() : SQL " SELECT * FROM 테이블 "를 실행
    // 2. findBy컬럼이름() : SQL " SELECT * FROM 테이블 WHERE 컬럼이름 = 값 "를 실행
    //    예 ) findById(2) : SELECT * FROM member WHERE id = 2
    //         findBuUser_id("hong") : SELECT * FROM member WHERE user_id = "hong"
    // 3. save() : SQL insert문과 update문 실행
    //             id값을 보고 없으면 insert, 있으면 update
    // 4. delete() : SQL Delete문 실행
}
