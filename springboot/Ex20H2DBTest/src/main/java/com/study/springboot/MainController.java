package com.study.springboot;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.lang.reflect.Member;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
// lombok에서 final or null인 멤버 변수만 생성자 함수로 생성
@RequiredArgsConstructor
public class MainController {

    private final MemberRepository memberRepository;

    @GetMapping("/")
    public String main(Model model){
        List<MemberEntity> list = memberRepository.findAll();
        model.addAttribute("list", list);
        return "index";
    }
}
