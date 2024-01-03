package com.study.springboot;
//AssertJ : JUnit5의 Assert함수와 비슷한 라이브러리
//          assertThat로 시작하는 함수
// 장점
// 1. 메소드 체이닝을 지원하기 때문에 좀 더 깔끔하고 읽기 쉬운 테스트 코드를 작성할 수 있습니다.
// 2. 개발자가 테스트를 하면서 필요하다고 상상할 수 있는 거의 모든 메소드를 제공합니다.
// 디펜던시
// testCompile 'org.assertj:assertj-core:3.6.2'

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.assertj.core.api.Assertions;
import org.assertj.core.api.SoftAssertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.assertj.core.api.Assertions.*;

@Getter
@Setter
@AllArgsConstructor
class User {
    private String name;
    private String nickname;
    private String email;
}

public class AssertJTest {
    @Test
    @DisplayName("isTrue테스트")
    void test1(){
        // given : 초기값
        User user = new User("hong", "", "bank@gmail.com");

        // when : 조건
        // then : 기대하는 결과값
        assertThat("".isEmpty()).isTrue(); //bool값이 true면 통과, false면 실패
        
        assertThat(user.getName().isEmpty()).isFalse(); // false면 통과
        assertThat(user.getNickname().isEmpty()).isTrue(); // true면 통과
    }

    @Test
    @DisplayName("list 테스트")
    void test2(){
        // given
        List<String> list = Arrays.asList("1", "2", "3");

        // when
        // then
        assertThat(list).contains("1"); // 포함하면 통과
        assertThat(list).isNotEmpty(); // 비어있지 않으면 통과
        assertThat(list).startsWith("1"); // "1"로 시작하면 통과
        assertThat(list)
                .isNotEmpty()
                .contains("1")
                .doesNotContainNull() // null을 포함하지 않으면 통과
                .containsSequence("2", "3"); // "2" 다음에 "3" 순서이면 통과
    }

    @Test
    @DisplayName("객체 비교 테스트")
    void test3(){
        // given
        User user1 = new User("hong", "도둑", "test@gmail.com");
        User user2 = new User("hong", "도둑", "test@gmail.com");

        // when
        // then
        // 객체 주소 비교
        // Assertions.assertThat(user1).isEqualTo(user1); // 객체 주소 비교 - 통과
        // Assertions.assertThat(user1).isEqualTo(user2); // 객체 주소 비교 - 실패
        // 객체 내용 비교
        assertThat(user1).usingRecursiveComparison().isEqualTo(user2);
    }

    @Test
    @DisplayName("맵 테스트")
    void test4() {
        //given

        //when
        Map<String, Object> map = new HashMap<String,Object>();
        map.put("name", "hong");

        //then
        assertThat(map)
                .isNotEmpty()
                .containsKey("name")
                .doesNotContainKeys("age")
                .contains(entry("name", "hong"));
    }

    @Test
    @DisplayName("예외 테스트")
    void test5() {
        // given
        String input = "abc";

        // when, then
        Assertions.assertThatThrownBy(() -> input.charAt(input.length()+1)) // 의도적 인덱스 오류
                .isInstanceOf(StringIndexOutOfBoundsException.class)
                .hasMessageContaining("String index out of range")
                .hasMessageContaining(String.valueOf(input.length())); // +1하면 통과
    }

    @Test
    @DisplayName("문자열 테스트")
    void test6() {

        //given
        //when
        //then
        assertThat("Hello, world! Nice to meet you.") // 주어진 "Hello, world! Nice to meet you."라는 문자열은
                .isNotEmpty() // 비어있지 않고
                .contains("Nice") // "Nice"를 포함하고
                .contains("world") // "world"도 포함하고
                .doesNotContain("ZZZ") // "ZZZ"는 포함하지 않으며
                .startsWith("Hell") // "Hell"로 시작하고
                .endsWith("u.") // "u."로 끝나며
                .isEqualTo("Hello, world! Nice to meet you."); // "Hello, world! Nice to meet you."과 일치합니다.
    }

    @Test
    @DisplayName("숫자 테스트")
    void test7() {
        //given
        //when
        //then
        Assertions.assertThat(3.14d) // 주어진 3.14라는 숫자는
                .isPositive() // 양수이고
                .isGreaterThan(3) // 3보다 크며
                .isLessThan(4) // 4보다 작습니다
                .isEqualTo(3, offset(1d)) // 오프셋 1 기준으로 3과 같고
                .isEqualTo(3.1, offset(0.1d)) // 오프셋 0.1 기준으로 3.1과 같으며
                .isEqualTo(3.14); // 오프셋 없이는 3.14와 같습니다
    }


    @Test
    @DisplayName("SoftAssertions이란 어떤 거지?")
    public void test8(){
        //given
        //when

        User user = new User("hong", "thief", "bank@gmail.com");

        //then

        //Soft Assertion
        //assertj기능중 하나로서
        //동시에 여러개의 테스트를 할 때 중간에 에러가나도 멈추지 않고, 모든 검사를 실행하고 결과를 보여줍니다.

        SoftAssertions softly = new SoftAssertions();
        softly.assertThat(user).isNotNull();
        softly.assertThat(user.getName()).isEqualTo("hong");
        softly.assertThat(user.getNickname()).isEqualTo("");
        softly.assertThat(user.getEmail()).isEqualTo("bankgmail.com");
        softly.assertAll();
    }

}
