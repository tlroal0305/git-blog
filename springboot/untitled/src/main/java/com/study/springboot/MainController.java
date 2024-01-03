package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    List<Product> productList = new ArrayList<>();

    @GetMapping("/")
    public String main() {
        if(productList.isEmpty()){
            return "index0";
        }else {
            return "index1";
        }
    }

    // 상품 추가하기
    // 추가 페이지
    @GetMapping("/register")
    public String register() {
        return "index2";
    }

    @PostMapping("/register-info")
    @ResponseBody
    public String register(Product product,
                           @RequestParam String name,
                           @RequestParam int price,
                           @RequestParam String date,
                           Model model) {

        product.setName(name);
        product.setPrice(price);
        product.setDate(date);
        productList.add(product);

        System.out.println("register 상품 목록: " + productList);


        return "<script>alert('상품이 추가되었습니다'); location.href='list';</script>";


    }

    // 상품 리스트
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("productList", productList);
        System.out.println("list 상품 목록: " + productList);


        int lastIndex = productList.size();
        model.addAttribute("lastIndex", lastIndex);

        System.out.println(lastIndex);

        if(productList.isEmpty()){
            return "index0";
        }else {
            return "index1";
        }
    }

    // 상품 리스트 삭제
    @GetMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam String index,
                         Model model) {
        productList.remove(Integer.parseInt(index));
        System.out.println("delete 상품 목록: " + productList);

        return "<script>alert('삭제되었습니다'); location.href='list';</script>";

    }

    // 상품 리스트 수정
    @GetMapping("/update")
    public String update(@RequestParam String index, Model model) {
        // 기존에 있던 데이터 정보를 보여줌
        model.addAttribute("product", productList.get(Integer.parseInt(index)));
        model.addAttribute("index",index);

        // 업데이트 페이지 이동
        return "index3";
    }

    @PostMapping("/update-info")
    @ResponseBody
    public String updateInfo(Product product,
                             @RequestParam String name,
                             @RequestParam int price,
                             @RequestParam String date,
                             @RequestParam String index,
                             Model model){

        // 해당 상품 목록 가져오기
        int productIndex = Integer.parseInt(index);

        // 상품 수정
        product.setName(name);
        product.setPrice(price);
        product.setDate(date);

        // 수정된 상품 리스트에 저장
        productList.set(productIndex, product);
        System.out.println("update 상품: " + productList);

        return "<script>alert('상품이 수정되었습니다'); location.href='list';</script>";


    }
}


