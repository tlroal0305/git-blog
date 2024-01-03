package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController // @Controller + @ResponseBody
// @Controller
// @ResponseBody // 클래스의 모든 응답이 JSON문자열로 됨
public class ApiController {
    @Autowired
    MemberService memberService; // 중간 레이어 역할, 로직을 꾸며줌

    // postman으로 Key와 Value를 받음
    // postman = DB역할
    @PostMapping("/loginAction1")
    public ResultDto loginAction1(@RequestParam String loginId,
                                 @RequestParam String loginPw){
        // memberService를 이용해서 로그인 액션을 처리
        // 더 많이 선호
        Member member = Member.builder()
                .loginId(loginId)
                        .loginPw(loginPw)
                                .build();

        int result = memberService.loginAction(member);
        ResultDto resultDto = new ResultDto();
        if ( result == 1 ){
            resultDto.setStatus("ok");
            resultDto.setMessage("로그인 성공!");
        }else{
            resultDto.setStatus("fail");
            resultDto.setMessage("로그인 실패!");

        }

        return resultDto; //JSON 문자열로 HTTP 응답  Body에 실려 내려감
    }

    // JS : KV 객체 {"loginId" : "hong", "loginPw" : "1234"}
    @PostMapping("/loginAction2")
    public ResultDto loginAction2(@RequestBody Member member ){

        int result = memberService.loginAction(member);
        ResultDto resultDto = new ResultDto();
        if ( result == 1 ){
            resultDto.setStatus("ok");
            resultDto.setMessage("로그인 성공!");
        }else{
            resultDto.setStatus("fail");
            resultDto.setMessage("로그인 실패!");

        }

        return resultDto;
    }


}
