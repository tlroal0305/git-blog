package com.study.springboot;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.lang.reflect.Member;
import java.time.LocalDate;
import java.util.List;

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
    // 5. count() : 테이터 행의 갯수를 가져옴
    //              SQL : SELECT COUNT(*) FROM 테이블


    // 1. 확장 함수 : 기본적인 함수만 쓰고, 복잡하면 NativeSQL을 사용하는 것이 좋음
    // 2. JPQL : Java Persistence Query Language, JPA에서 지원하는 쿼리
    // 3. Native SQL : 표준 SQL 지원


    // find
    // private String user_id; 언더바는 생략, 단어와 단어는 대문자로 시작
    // SQL : SELECT * FROM member WHERE user_id = "param1"
    // 위 SQL문을 ( 아래의 )함수가 만들어줌

    // i) 확잠 함수
    List<MemberEntity> findByUserId ( String param1 ); //pararm1dl 위 param1과 맵핑
    // ii) JPQL
    // memberEntity -> 클래스 이름
    // m -> 테이블 명
    // = :userid 형태 지키기, 안그러면 test 통과 X
    @Query(value = "SELECT m FROM MemberEntity m WHERE m.userId = :userid")
    List<MemberEntity> findByUserId_JPQL ( String userid );
    // iii) nativeQuery
    @Query(nativeQuery = true,
            value = "SELECT * FROM member WHERE user_Id = :userid")
    List<MemberEntity> findByUserId_nativeQuery ( String userid );


    // insert, update : save 함수
    // delete : delete 함수
    // delete

    // i) 확잠 함수 X
    // 기본 함수 save, delete 사용
    // ii) JPQL
    // iii) Native SQL(Query) : insert, update, delete문은
    //                           @Modifying, @Transcational을 써줘야 함
    // @Modifying : 수정하는 쿼리라는 것을 알려줌
    // @Transcational : DB 트랜잭션( 하나의 동작 )에서 자동 commit( 물리적 저장 )을 의미
    @Modifying
    @Transactional
    @Query(nativeQuery = true,
            value = "UPDATE member SET user_id = :userid WHERE id = :id")
    int updateByUserId_nativeQuery( String userid, Long id );

    // < 확장 함수 이용 >
    //문제1
    //user_id가 "hong"이고, user_pw가 "1234"인 행의 갯수를 출력하시오. 출력:1
    List<MemberEntity> findByUserIdAndUserPw(String userid, String userpw);
    //문제2
    //user_id에 "h"가 들어간 행의 갯수를 출력하시오. 출력:2
    List<MemberEntity> findByUserIdContaining(String keyword);
    //문제3
    //member 테이블의 모든 행에서 처음 2개만 출력하시오. 정렬방식은 joindate의 내림차순이다.
    List<MemberEntity> findFirst2ByOrderByJoindateDesc();
    //문제4
    //오늘날짜(2023-10-17)보다 더 이후에 가입한 회원의 아이디만 출력하시오.
    List<MemberEntity> findByJoindateGreaterThanEqual(LocalDate joindate);


    // < nativeQuery 이용 >
    // 문제 1
//    @Query(nativeQuery = true,
//            value = "SELECT * FROM member WHERE user_Id = :userid AND user_pw = :userpw")
//    List<MemberEntity> nativeQuery1 ( String userid, int userpw );
//    // 문제 2
//    @Query(nativeQuery = true,
//            value = "SELECT * FROM member WHERE user_id LIKE '%h%'")
//    List<MemberEntity> nativeQuery2 ( String userid );
//    // 문제 3
//    @Query(nativeQuery = true,
//            value = "SELECT * FROM member ORDER BY joindate DESC")
//    List<MemberEntity> nativeQuery3 ( Long id);
//    // 문제 4
//    @Query(nativeQuery = true,
//            value = "SELEC * FROM member WHERE joindate >= 2023-10-17")
//    List<MemberEntity> nativeQuery4 ( Long id );
}
