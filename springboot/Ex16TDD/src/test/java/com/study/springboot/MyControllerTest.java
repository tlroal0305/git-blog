package com.study.springboot;

import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(controllers = MyController.class)
class MyControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Test
    public void helloTest() throws Exception{
        String hello = "hello";

        mockMvc.perform(get("/hello"))
                .andExpect(status().isOk())
                .andExpect(content().string(hello));
    }

    @Test
    public void loginTest() throws Exception{
        MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
        param.add("id", "hong");
        param.add("pw","1234");

        mockMvc.perform(get("/login").params(param))
                .andExpect(status().isOk())
                .andExpect(content().string("1"));
    }

    @Test
    public void joinTest() throws Exception {
        MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
        param.add("id", "hong");
        param.add("pw","1234");

        mockMvc.perform(get("/join").params(param))
                .andExpect(status().isOk())
                .andExpect(content().string("1"))
                .andDo(print());
    }


}