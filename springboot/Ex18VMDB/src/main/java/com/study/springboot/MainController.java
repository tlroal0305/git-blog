package com.study.springboot;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductRepository productRepository;

    @GetMapping("/")
    public String main() {
        List<Product> productList = productRepository.findAll();

        if (productList.isEmpty()) {
            return "index0";
        } else {
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
                           @RequestParam String  name,
                           @RequestParam int  price,
                           @RequestParam String date,
                           Model model){
        product.setName(name);
        product.setPrice(price);
        product.setDate(date);
        productRepository.save(product);
        System.out.println(productRepository);

        return "<script>alert('상품이 추가되었습니다'); location.href='list';</script>";


    }

    // 상품 리스트
    @GetMapping("/list")
    public String list(Product product,
                       Model model) {
        List<Product> productList = productRepository.findAll();

        // productRepository를 사용하여 데이터베이스에서 모든 상품을 가져와 productList에 할당
        model.addAttribute("list", productList);

        int lastNumber = productList.size();
        model.addAttribute("lastIndex", lastNumber);

        if (productList.isEmpty()) {
            return "index0";
        } else {
            return "index1";
        }
    }

    // 상품 리스트 삭제
    @GetMapping("/delete")
    @ResponseBody
    public String delete(@RequestParam Long index) {
        productRepository.deleteById(index);
        System.out.println("delete 상품 목록: " + productRepository);

        return "<script>alert('삭제되었습니다'); location.href='list';</script>";

    }

    // 상품 리스트 수정
    @GetMapping("/update")
    public String update(@RequestParam Long index, Model model) {
        // 기존에 있던 데이터 정보를 보여줌
        model.addAttribute("index",index);

        // 단일 조회
        Optional<Product> optional = productRepository.findById(index);
        if( optional.isPresent() ){ // null이 아닐 때
            Product product = optional.get();

            model.addAttribute("product",product);
        }else {
            System.out.println( "널 입니다" );
        }


        // 업데이트 페이지 이동
        return "index3";
    }

    @PostMapping("/update-info")
    @ResponseBody
    public String updateInfo(Product product,
                             @RequestParam String name,
                             @RequestParam int price,
                             @RequestParam String date,
                             @RequestParam Long index,
                             Model model){

        // 해당 상품 목록 가져오기
        model.addAttribute("index", index);


        // 상품 수정
        // index = product.id
        // 고칠 PK를 정하지 않아서 save하면 추가됨
        product.setId(index);
        product.setName(name);
        product.setPrice(price);
        product.setDate(date);

        // 기존에 있던 상품 삭제
        //productRepository.deleteById(index);
        // 수정된 상품 리스트에 저장
        productRepository.save(product);

        return "<script>alert('상품이 수정되었습니다'); location.href='list';</script>";


    }
}


