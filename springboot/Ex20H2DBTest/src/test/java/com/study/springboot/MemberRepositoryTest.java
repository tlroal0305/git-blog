package com.study.springboot;

import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import static org.assertj.core.api.Assertions.assertThat;

import java.awt.*;
import java.lang.reflect.Member;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.junit.jupiter.api.Assertions.*;

// class MemberRepositoryTest extends MemberRepository 같은 동작
@DataJpaTest
@ExtendWith(SpringExtension.class)
// 실제 구성된 db 사용
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class MemberRepositoryTest {
    // Test 코드에서는 생성자 주입 X
    // 필드 주입 대체
    @Autowired
    MemberRepository memberRepository;

    // 처음에 한번 호출
    @BeforeAll
    static void beforeAll(){
        // set up

    }

    // static은 static만 호출 가능
    // id가 hong인 행이 3개 생성
    void setup(){

        MemberEntity memberEntity = MemberEntity.builder()
                .id(0L)
                .userId("hong")
                .userPw("1234")
                .userRole("role_user")
                .joindate(LocalDate.parse("2023-10-01"))
                .build();
        memberRepository.save(memberEntity);

        memberEntity = MemberEntity.builder()
                .id(0L)
                .userId("lee")
                .userPw("2222")
                .userRole("role_admin")
                .joindate(LocalDate.parse("2023-11-01"))
                .build();
        memberRepository.save(memberEntity);

        memberEntity = MemberEntity.builder()
                .id(0L)
                .userId("hana")
                .userPw("3333")
                .userRole("role_guest")
                .joindate(LocalDate.parse("2023-12-01"))
                .build();
        memberRepository.save(memberEntity);

    }

    // 마지막에 한번 호출
    @AfterAll
    static void afterAll(){
        // clean
    }

    // 매 테스트마다 호출
    @BeforeEach
    void beforeEach(){
    }

    @Test
    @DisplayName("save 테스트")
    public void save(){
        // given
        MemberEntity memberEntity = MemberEntity.builder()
                .id(1L)
                .userId("hong")
                .userPw("1234")
                .userRole("role_user")
                .joindate(LocalDate.now())
                .build();
        MemberEntity newEntity =  memberRepository.save(memberEntity);

        // when & then
        // newEntity.getId()와 memberEntity.getId()가 같으면
        assertEquals(newEntity.getId(), memberEntity.getId());
        assertThat(memberEntity).isEqualTo(newEntity);
    }

    // findAll은 리스트와 같음
    @Test
    @DisplayName("findAll 테스트")
    public void findAll(){
        // given

        // when & then
        List<MemberEntity> list = memberRepository.findAll();
        assertEquals(3, list.size());
        // list의 0번째를 가져옴
        MemberEntity memberEntity = list.get(0);
        // hong이라는 id가 있는가 ?
        assertThat(memberEntity.getUserId()).isEqualTo("hong");
    }

    @Test
    @DisplayName("findById 테스트")
    public void findById() {
        // 방법 1)
        // null일 때는 Exception 발생 가능
        MemberEntity memberEntity = memberRepository.findById(1L).get();

        // 방법 2)
        // null safety
        Optional<MemberEntity> member = memberRepository.findById(1L); // 3번째 목록을 조회
        List<MemberEntity> list = new ArrayList<>();
        if (member.isPresent()) { // null이 아닐 때
            MemberEntity memberEntity2 = member.get();
            list.add(memberEntity);
        } else {
            System.out.println("널 입니다");
        }

        // 방법 3)
        // null safety -> 람다식 표현
        member.ifPresent(memberEntity3 -> {
            System.out.println(memberEntity3.getId());
        });

        // when & then
        assertEquals("hong", memberEntity.getUserId());
        assertThat(memberEntity.getUserId()).isEqualTo("hong");
    }

    @Test
    @DisplayName("count 테스트")
    public void count(){
        // given
        // SQL : SELECT COUNT(*) FROM member;
        // DB 테이블에 몇개 있는가 ?
        long count = memberRepository.count();
        System.out.println("count: " + count);
        // when & then
        assertEquals(3, count );
    }


    @Test
    @DisplayName("update 테스트")
    public void update() {
        // given
        Optional<MemberEntity> member = memberRepository.findById(1L);
        member.ifPresent( memberEntity -> {
            // when& then
            memberEntity.setUserId("lee");
            MemberEntity newEntity = memberRepository.save( memberEntity );
            assertEquals( newEntity.getUserId(), memberEntity.getUserId());

        });
    }

    @Test
        @DisplayName("delete 테스트")
        public void delete() {
            // given
            Optional<MemberEntity> member = memberRepository.findById(1L);
            member.ifPresent(memberEntity -> {
                // when& then
                memberRepository.delete(memberEntity);

                Optional<MemberEntity> member2 = memberRepository.findById(1L);
                System.out.println("member2: " + member2);
                // member2가 null일 때가 정상
                // assertThatThrownBy : 익셉션이 발생하는 케이스를 테스트할 때 사용
                assertThatThrownBy(() -> member2.get())
                        .isInstanceOf(NoSuchElementException.class);
            });
    }

        @Test
        @DisplayName("findByUserId 테스트")
        public void findByUserId(){
        // given
        // id가 3개 들어옴 ( 위에서 hong이라는 아이디를 3개 생성했기 떄문 )
        List<MemberEntity> list = memberRepository.findByUserId("hong");
        // when & then
        assertThat(list.size()).isEqualTo(3);

        // findByUserId_JPQL
        List<MemberEntity> list2 = memberRepository.findByUserId_JPQL("hong");
        assertThat(list2.size()).isEqualTo(3);

        // findByUserId_NativeSQL
            List<MemberEntity> list3 = memberRepository.findByUserId_nativeQuery("hong");
            assertThat(list3.size()).isEqualTo(3);

    }

    @Test
    @DisplayName("updateByUserId_NativeSQL 테스트")
    public void updateByUserId_NativeSQL(){
        // id가 1인 데이터의 user_id를 "lee"로 바꿔라
        int result = memberRepository.updateByUserId_nativeQuery("lee", 1L);
            assertEquals( result, 1);

    }

    @Test
    @DisplayName("기본 함수 Query 테스트")
    public void queryTest(){
        //문제1
        //user_id가 "hong"이고, user_pw가 "1234"인 행의 갯수를 출력하시오. 출력:1
        List<MemberEntity> list = memberRepository.findByUserIdAndUserPw("hong", "1234");
        System.out.println(list.size());
        //문제2
        //user_id에 "h"가 들어간 행의 갯수를 출력하시오. 출력:2
        list = memberRepository.findByUserIdContaining("h");
        System.out.println(list.size());
        //문제3
        //member 테이블의 모든 행에서 처음 2개만 출력하시오. 정렬방식은 joindate의 내림차순이다.
        list = memberRepository.findFirst2ByOrderByJoindateDesc();
        System.out.println(list.size());
        for(MemberEntity m : list){
            System.out.println(m.getUserId());
        }
        //문제4
        //오늘날짜(2023-10-17)보다 더 이후에 가입한 회원의 아이디만 출력하시오.
        list = memberRepository.findByJoindateGreaterThanEqual(LocalDate.now());
        for(MemberEntity m : list) {
            System.out.println(m.getUserId());
        }
    }

}