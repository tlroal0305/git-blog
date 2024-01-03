package com.study.springboot;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

//JPA가 뭔가요?
//JPA(Java Persistence API, JPA)는 자바 플랫폼 SE와 자바 플랫폼 EE를 사용하는
//   응용프로그램에서 관계형 데이터베이스의 관리를 표현하는 자바 API이다.
//기존에 EJB에서 제공되던 엔터티 빈(Entity Bean)을 대체하는 기술이다.
// 자바 퍼시스턴스 API는 JSR 220에서 정의된 EJB 3.0 스펙의 일부로 정의가 되어 있지만
// EJB 컨테이너에 의존하지 않으며 EJB,
// 웹 모듈 및 Java SE 클라이언트에서 모두 사용이 가능하다.
// 또한, 사용자가 원하는 퍼시스턴스 프로바이더 구현체를 선택해서 사용할 수 있다.

//JDBC 란? JDBC(Java Database Connectivity)는 자바에서 데이터베이스에
//  접속할 수 있도록 하는 자바 API이다.
//  JDBC는 데이터베이스에서 자료를 쿼리하거나 업데이트하는 방법을 제공한다.
//  1. JDBC 템플릿 클래스 2. MyBatis Mapper 프레임워크, 3. JPA ORM 프레임워크

//객체 관계 매핑(Object-relational mapping; ORM)은 데이터베이스와
//   객체 지향 프로그래밍 언어 간의 호환되지 않는 데이터를 변환하는 프로그래밍 기법이다.
//  Table ( 컬럼/데이터 ) <= 맵핑 => Java Class ( 멤버 변수 / 값 )

//Hibernate 하이버네이트 : ORM(Hibernate ORM)은
//  자바 언어를 위한 객체 관계 매핑 프레임워크이다.
//  객체 지향 도메인 모델을 관계형 데이터베이스로 매핑하기 위한 프레임워크를 제공한다.
//  JDBC API 구현체

// H2 데이터베이스는 주로 개발용이나 소규모 프로젝트에서
// 사용되는 파일 기반의 경량 데이터베이스이다.
// 개발시에는 H2를 사용하여 빠르게 개발하고 실제 운영시스템은
// 좀 더 규모있는 DB를 사용하는 것이 일반적인 개발 패턴이다.
//1. In Memory : 메모리에만 존재하는 DB 데이타
//2. Local PC file : 로컬PC 파일 형태로 존재하는 DB 데이타
// h2-console 호출 URL : http://localhost:8080/h2-console

@Controller
// lombok에서 final or null인 멤버 변수만 생성자 함수로 생성
@RequiredArgsConstructor
public class MainController {
    // 생성자 주입 : 1. final 재할당 X, 2. 객체 생성 우선 순위가 높음
    private final MemberRepository memberRepository;

    @GetMapping("/")
    public String main(Model model){
        // insert문
        MemberEntity memberEntity1 = new MemberEntity(Long.valueOf(1), "hong", "1234",
                "홍길동", "ROLE_USER", LocalDate.now());
        MemberEntity memberEntity2 = new MemberEntity(Long.valueOf(2), "hong", "1234",
                "홍길동", "ROLE_USER", LocalDate.now());

        memberRepository.save(memberEntity1);
        memberRepository.save(memberEntity2);

        // update문
        MemberEntity memberEntity3 = new MemberEntity(Long.valueOf(2), "lee", "1234",
                "이순신", "ROLE_USER", LocalDate.now());
        memberRepository.save(memberEntity3);

        // delete문
        memberRepository.delete(memberEntity3);

        // select문 : findBy(컬럼명)
        memberRepository.save(memberEntity3); // 이순신 추가 => id는 3으로 추가, auto_increase 됨

        // Optional : null일지 아닐지 모르는 상황에서 사용하는 래퍼 클래스
        Optional<MemberEntity> optional = memberRepository.findById(Long.valueOf(3));
        List<MemberEntity> list = new ArrayList<>();
        if( optional.isPresent() ){ // null이 아닐 때
            MemberEntity memberEntity = optional.get();
            list.add(memberEntity);
        }else {
            System.out.println( "널 입니다" );
        }

        // select문 : findAll(컬럼명)
        // 저장소에 저장된 컬럼을 모두 가져옴
        // findAll() : SQL, " SELECT * FROM 테이블 " 실행
        // List<MemberEntity> list = memberRepository.findAll();
        model.addAttribute("list", list);
        return "index";
    }
}
