package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.DataTruncation;

@Controller
public class MainController {
    int money = 0;

    @GetMapping("/")
    public String vm(Model model) {
        model.addAttribute("outCoin", money);
        return "vm";
    }

    @RequestMapping("/calc")
    public String calc( Coin coin,
                        Model model){

        System.out.println(coin.getCoin1000());
        System.out.println(coin.getCoin500());
        System.out.println();


        return "vm";
    }

}
