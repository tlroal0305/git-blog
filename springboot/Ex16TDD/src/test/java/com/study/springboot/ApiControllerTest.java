package com.study.springboot;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.verify;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ApiController.class)
class ApiControllerTest {
    // Test에서 쓸 가짜 요청 만들기
    @Autowired
    private MockMvc mockMvc;

    // @MockBean : ApiController에서 주입받은 Bean 객체에 대해서 Mock 형태의 객체 생성
    //             ApiController에서 MemberService라는 가짜 요청이 존재
    @MockBean
    MemberService memberService;

    @Autowired
    private WebApplicationContext ctx;

    @BeforeEach
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx)
                .addFilters(new CharacterEncodingFilter("UTF-8", true))  // 필터 추가
                .alwaysDo(print())
                .build();
    }

    @Test
    @DisplayName("로그인 테스트1")
    void loginAction1() throws Exception {
        // given
        // given : Mock객체가 특정 상황에서 해야하는 행위를 정의하는 메서드
        //         값
        given(memberService.loginAction(new Member( "hong","1234" )))
                .willReturn(1);

        // when & then
        // 조건   기대하는 결과값
        String loginId = "hong";
        String loginPw = "1234";

        // 기대하는 응답 DTO 객체 생성
        ResultDto resultDto = ResultDto.builder()
                        .status("ok")
                                .message("로그인 성공!")
                                        .build();
        // DTO 객체를 문자열로 변환 : GSON
        // 클래스를 문자열로 변환
        Gson gson = new Gson();
        String content = gson.toJson(resultDto);
        System.out.println("content: " + content);
        // 아래 코드로 json 형태 변경 작업을 대체할 수 있음
        String json = new ObjectMapper().writeValueAsString(resultDto);
        System.out.println(json);


        mockMvc.perform(post("/loginAction1")
                        .param("loginId", loginId)
                        .param("loginPw", loginPw) )
                // Body = {"status":"ok","message":"로그인 성공!"}
                .andExpect(jsonPath("$.status").value("ok")) // value가 ok가 되었는가 ? 통과되면 렌더링 X
                .andExpect(jsonPath("$.message").exists()) // 키 값이 존재하는가 ?
                .andExpect(content().string(content)) // content가 문자열인가 ?
                .andExpect(status().isOk())
                .andDo(print());

    }

    @Test
    @DisplayName("로그인 테스트2")
    void loginAction2() throws Exception {
        // given
        // given : Mock객체가 특정 상황에서 해야하는 행위를 정의하는 메서드
        //         값
        given(memberService.loginAction(new Member( "hong","1234" )))
                .willReturn(1);

        // when & then
        // 조건   기대하는 결과값
        String loginId = "hong";
        String loginPw = "1234";

        // 기대하는 응답 DTO 객체 생성
        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .message("로그인 성공!")
                .build();

        // DTO 객체를 문자열로 변환 : GSON
        // 클래스를 문자열로 변환
        Gson gson = new Gson();
        String content = gson.toJson(resultDto);
        System.out.println("content: " + content);
        // 아래 코드로 json 형태 변경 작업을 대체할 수 있음
        String json = new ObjectMapper().writeValueAsString(resultDto);
        System.out.println(json);

        Member member = Member.builder()
                .loginId("hong")
                .loginPw("1234")
                .build();


        mockMvc.perform(post("/loginAction2")
                                .content(gson.toJson(member)) // memeber 객체를 json으로 변환
                                .contentType(MediaType.APPLICATION_JSON))
                // Body = {"status":"ok","message":"로그인 성공!"}
                .andExpect(jsonPath("$.status").value("ok")) // value가 ok가 되었는가 ? 통과되면 렌더링 X
                .andExpect(jsonPath("$.message").exists()) // 키 값이 존재하는가 ?
                .andExpect(content().string(content)) // content가 문자열인가 ?
                .andExpect(status().isOk())
                .andDo(print());

        // verify : 해당 객체의 메서드가 실행되었는지 체크해줌
        verify(memberService).loginAction(new Member("hong", "1234"));

    }
}