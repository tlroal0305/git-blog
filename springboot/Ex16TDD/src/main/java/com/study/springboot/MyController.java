package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MyController {
    @GetMapping("/hello")
    public String hello(){
        System.out.println("hello");
        return "hello";

    }

    @GetMapping("/login")
    public String longin(String id, String pw){
        int result = resultFrmo(id, pw);

        return String.valueOf(result);
    }

    @GetMapping("/join")
    public String join(String id, String pw){
        int result = resultFrmo(id, pw);

        return String.valueOf(result);
    }

    int resultFrmo(String id, String pw) {
        if( id.equals("hong") && pw.equals("1234")){
            return 1;
        }
        return 0;
    }
}
