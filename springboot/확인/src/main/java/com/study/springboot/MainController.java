package com.study.springboot;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


// 1. 상품 갯수가 0일 때에는 "상품목록이 없습니다" 출력
// 2. 상품 목록과 총 갯수를 서버에서 데이터로 받아서 처리
// 3. 상품 추가하기 클릭시 상품등록 화면으로 이동함
// 4. 수정 클릭시 수정하기 화면으로 이동함
// 5. 삭제 클릭시 자바스크립트 경고(Alert)창으로 "삭제되었습니다" 출력


@Controller
@RequiredArgsConstructor
public class MainController {
    private final ProductRepository productRepository;

    List<Product> productList = null;

    @GetMapping("/")
    public String main(Model model){

        productList = productRepository.findAll();

        model.addAttribute("productList", productList);

        model.addAttribute("isEmpty", productList.isEmpty());
        return "index";
    }

    @GetMapping("/addProductForm")
    public String addProduct(Model model){
        return "addProduct";
    }

    @PostMapping("/addProduct")
    @ResponseBody
    public String addProductAction(@RequestParam  String inputName,
                                   @RequestParam  int inputPrice,
                                   @RequestParam String inputLimitDate, Model model) {
        System.out.println(inputLimitDate);

        Product product = Product.builder()
                .id(0L)
                .name(inputName)
                .price(inputPrice)
                //'2023-10-16'
                .limit_date(LocalDate.parse(inputLimitDate))
                .build();
        Product newProduct = productRepository.save(product);
        String p1 = product.toString();
        String p2 = newProduct.toString();
        if( newProduct == null || p1.equals(p2) == false ){
            return "<script>alert('추가 실패!');location.href='/';</script>";
        }

        return "<script>alert('추가 성공!');location.href='/';</script>";
    }

    // 상품 수정
    @GetMapping("/editProductForm")
    public String editProduct(@RequestParam String index, Model model) {

        // 기존 데이터 출력
        Optional<Product> optional = productRepository.findById(Long.valueOf(index));
        if( optional.isPresent() ){ //null이 아닐때
            Product product = optional.get();
            model.addAttribute("product", product);
            model.addAttribute("index", product.getId());
        }else{ //null일때
            System.out.println("널입니다.");
        }

        System.out.println(index);

        return "editProduct";
    }

    @PostMapping("/editProduct")
    @ResponseBody
    public String editProductAction(@RequestParam int index,
                                    @RequestParam String inputName,
                                    @RequestParam int inputPrice,
                                    @RequestParam String inputLimitDate,
                                    Model model) {

        Product product = Product.builder()
                .id(Long.valueOf(index))
                .name(inputName)
                .price(inputPrice)
                //'2023-10-16'
                .limit_date(LocalDate.parse(inputLimitDate))
                .build();
        Product newProduct = productRepository.save(product);
        if( newProduct == null){
            return "<script>alert('수정 실패!');location.href='/';</script>";
        }

        String p1 = product.toString();
        String p2 = newProduct.toString();
        System.out.println("p1:"+p1);
        System.out.println("p2:"+p2);
        if( p1.equals(p2) == false){
            return "<script>alert('수정 실패!');location.href='/';</script>";
        }

        return "<script>alert('수정 성공!');location.href='/';</script>";
    }

    // 상품 삭제
    @GetMapping("/deleteProduct")
    @ResponseBody
    public String deleteProduct(@RequestParam String index, Model model) {

        Optional<Product> optional = productRepository.findById(Long.valueOf(index));
        if( optional.isPresent() ){ //null이 아닐때
            Product product = optional.get();
            productRepository.delete(product);
            return "<script>alert('삭제 성공!');location.href='/';</script>";
        }else{ //null일때
            System.out.println("널입니다.");
            return "<script>alert('삭제 실패!');location.href='/';</script>";
        }

    }

}
