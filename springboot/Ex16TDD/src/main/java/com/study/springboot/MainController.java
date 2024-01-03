package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @GetMapping("/")
    public String main(Model model){
        //필드가 있는 생성자
        Member member = new Member("hong", "1234");
        //Builder를 이용
        //1. 매개변수의 순서와 갯수를 지키지 않아도 됨.
        //2. 매개변수 이름을 외우지 않아도 됨.
        Member member2 = Member.builder()
                .loginPw("1234")
                .loginId("hong")
                .build();


        List<String> list = new ArrayList<>(
                List.of("hong", "lee"));

        model.addAttribute("list", list);
        model.addAttribute("member", member);

        return "index";
    }
}