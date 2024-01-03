package com.study.springboot;


// [ 데이터 모델링 클래스 ( 데이터를 담는 클래스 ) ]
// 1. DTO : Data Transfer Object
//           계층 ( Controller, Service, Repp, Entity )간의 데이터 전송시 사용
// 2. VO : View Object
// 3. ENTITY : DB 테이블과 1:1로 매칭
// 4. DAO : Data Access Object
//           DB에 접근하는 클래스 의미

//              로직 포함 X
//               로직 (코드)   데이터 변경
// DTO               X            O
// VO                O            X
// ENTITY            X            X

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

// DB 테이블과 1:1 매칭
@Entity
// 테이블 이름 지정
@Table( name = "member" )
// 객체 생성
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberEntity {
    // 기본키로 설정
    @Id
    // 해당 id값을 어떻게 생성할지 전략 선언
    // 1. IDENTITY : MySql, MariaDB, H2DB
    // 2. SEQUENCE : Oracle, PostgreSQL
    // 3. AUTO : 해당 DB에 따라 자동으로 선택
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // 기본키
    // 기존에 있던 DB 컬럼 이름과 변수 이름이 다르면 맞춰줌
    @Column( name = "user_id" )
    private String userId;
    @Column( name = "user_pw" )
    private String userPw;
    @Column( name = "user_name" )
    private String userName;
    @Column( name = "user_role" )
    private String userRole; // 권한 : "damin", "user"
    // DB Table date 포맷을 형식화
    // 없으면 불러오지 X
    @DateTimeFormat( pattern = "yyyy-MM-dd" )
    private LocalDate joindate; // 가입일 : "2023-10-12"
}
