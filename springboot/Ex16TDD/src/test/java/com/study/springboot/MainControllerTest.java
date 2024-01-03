package com.study.springboot;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

//@WebMvcTest : @Controller, @RestController가 설정된 컨트롤러 클래스들을
//               찾아 메모리에 생성한다.
//            : @Service, @Repository에는 사용할 수 없다.
//@RestController : @Controller + @ReposeBody 조합, RestAPI 컨트롤러에 사용
//@Service : 서비스 로직(코드)들이 있는 클래스 레이어
//@Repository : 데이터베이스를 조작하는 코드가 있는 클래스 레이어
//  HTTP 요청 -> WAS(톰캣) -> @Controller -> @Service -> @Repository -> DBMS
//  HTTP 응답 <- WAS(톰캣) <- @Controller <- @Service <- @Repository -> DBMS
//                                           DTO/VO      DAO/Entity
@WebMvcTest(MainController.class)
class MainControllerTest {
    //MockMvc : 웹 API를 테스트할 때
    //        : 가짜 HTTP 요청을 만들어주는 클래스이다.
    @Autowired
    private MockMvc mockMvc;

    @Test
    @DisplayName("루트 테스트")
    void main() throws Exception {

        Member member = new Member("hong", "1234");

        mockMvc.perform(get("/"))
                .andExpect(status().isOk()) // HTTP 응답 200이면 성공
                .andExpect(view().name("index")) // index.html인가 ?
                .andExpect(model().attributeExists("member")) // model에 member라는 객체가 있는가 ?
                .andExpect(model().attribute("member", member)) // model객체와 member 객체가 같은가 ?
                .andExpect(model().attribute("list", Matchers.contains("hong", "lee")))
                .andDo(print()); // 로그 출력
    }
}