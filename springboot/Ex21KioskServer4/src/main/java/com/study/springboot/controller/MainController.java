package com.study.springboot.controller;

import com.study.springboot.dto.FileDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.ResultDto;
import com.study.springboot.entity.*;
import jakarta.persistence.criteria.Order;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.hibernate.query.results.complete.ModelPartReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class MainController {

    boolean isTakeOut = true; //테이크아웃인가?

    @GetMapping("/")
    public String index(){
        return "redirect:/main";
    }
    @GetMapping("/main")
    public String main(){
        return "main";
    }
    @GetMapping("/loginForm")
    public String loginForm(){
        return "login";
    }
    @GetMapping("/joinForm")
    public String joinForm(){
        return "join";
    }
    @GetMapping("/OrderSelect")
    public String orderSelect(){
        return "OrderSelect";
    }

    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private OrderRepository orderRepository;

    @GetMapping("/MenuSelect")
    public String menuSelect(Model model, HttpServletRequest request){
        String loginId = (String)request.getSession().getAttribute("loginId");
        if( loginId != null ){
            List<MemberEntity> list = memberRepository.findByMemberId(loginId);
            if( list.size() > 0 ){
                MemberEntity memberEntity = list.get(0);
                model.addAttribute("loginNickname", memberEntity.getMemberName());
            }
        }

        return "MenuSelect";
    }
    @GetMapping("/Payment")
    public String payment(){
        return "Payment";
    }
    @GetMapping("/Cart")
    public String cart(){
        return "Cart";
    }
    @GetMapping("/AddItem")
    public String AddItem(){
        return "AddItem";
    }
    @GetMapping("/Thanks")
    public String thanks(Model model, HttpServletRequest request){
        String loginId = (String)request.getSession().getAttribute("loginId");
        if( loginId != null ){
            List<MemberEntity> list = memberRepository.findByMemberId(loginId);
            if( list.size() > 0 ){
                MemberEntity memberEntity = list.get(0);
                model.addAttribute("memberPoint", memberEntity.getMemberPoint());
            }
        }
        return "Thanks";
    }
    @GetMapping("/takeOut/{isTakeOut}")
    public String takeOut(@PathVariable int isTakeOut){
        if( isTakeOut == 1 ){
            this.isTakeOut = true;
            System.out.println("테이크아웃");
        }else{
            this.isTakeOut = false;
            System.out.println("인스토어");
        }
        return "redirect:/MenuSelect";
    }

    // 회원 목록 조회
    @GetMapping("/MemberList")
    public String MemberList(Model model){
        List<MemberEntity> list = memberRepository.findAll();
        model.addAttribute("memberList", list);
        return "MemberList";
    }

    // 회원 수정
    @GetMapping("/updateForm")
    public String updateForm(@RequestParam String memberNo,
                             Model model) {
        // 기존에 있던 데이터 정보를 보여줌
        // 수정/삭제할 index는 DB의 고유키와 맞춰줘야 함 
        int memberNoInt = Integer.parseInt(memberNo);
        Optional<MemberEntity> optional = memberRepository.findById((long) memberNoInt);
        if( optional.isPresent() ){ //null이 아닐때
            MemberEntity memberEntity = optional.get();
            model.addAttribute("member", memberEntity);
            model.addAttribute("memberNo", memberNo);
        }else{ //null일때
            System.out.println("널입니다.");
        }

        // 업데이트 페이지 이동
        return "MemberUpdate";
    }

    // 회원 정보 삭제
    @GetMapping("/delete")
    public String delete( @RequestParam Long memberNo,
                          Model model){

        Optional<MemberEntity> optional = memberRepository.findById(memberNo);
        if( optional.isPresent() ){ //null이 아닐때
            MemberEntity memberEntity = optional.get();
            memberRepository.deleteById(memberNo);
        }

        return "redirect:/ProductList";
    }

    @Autowired
    private ItemRepository itemRepository;


    // 상품 목록 조회
    @GetMapping("/ProductList")
    public String ProductList(Model model){
        List<ItemEntity> list = itemRepository.findAll();
        model.addAttribute("itemList", list);
        return "ProductList";
    }
    
    // 상품 수정
    // 단권 조회 부분
    @GetMapping("/itemUpdateForm")
    public String itemUpdateForm(@RequestParam Long itemNo,
                                  @RequestParam int itemRecommend,
                                  Model model) {
        Optional<ItemEntity> optional = itemRepository.findById(itemNo);
        if( optional.isPresent() ){ //null이 아닐때
            ItemEntity itemEntity = optional.get();
            model.addAttribute("item", itemEntity);
            model.addAttribute("itemNo", itemNo);
            model.addAttribute("itemRecommend", itemRecommend);
        }else{ //null일때
            System.out.println("널입니다.");
        }

        // 업데이트 페이지 이동
        return "ProductUpdate";
    }

    // 상품 정보 삭제
    @GetMapping("/itemDelete")
    public String  itemDelete(@RequestParam Long itemNo,
                                    @RequestParam int itemRecommend,
                                    Model model) {
        System.out.println(itemNo);
        System.out.println(itemRecommend);

        Optional<ItemEntity> optional = itemRepository.findByItemRecommendAndItemNo(itemRecommend,itemNo);
        if( optional.isPresent() ){ //null이 아닐때
            ItemEntity itemEntity = optional.get();
            itemRepository.delete(itemEntity);
        }else{ //null일때
            System.out.println("널입니다.");
        };
        // 업데이트 페이지 이동
         return "redirect:/ProductList";
    }

    // 주문 정보 조회
    @GetMapping("/OrderList")
    public String OrderList(Model model){

        List<OrderEntity> list = orderRepository.findAll();
        model.addAttribute("orderList", list);

        return "OrderList";
    }

    // 주문 수정
    // 단권 조회 부분
    @GetMapping("/orderUpdateForm")
    public String orderUpdateForm(@RequestParam Long orderNo,
                                  Model model) {
        Optional<OrderEntity> optional = orderRepository.findById(orderNo);
        if( optional.isPresent() ){ //null이 아닐때
            OrderEntity orderEntity = optional.get();
            model.addAttribute("order", orderEntity);
            model.addAttribute("orderNo", orderNo);
        }else{ //null일때
            System.out.println("널입니다.");
        }

        // 업데이트 페이지 이동
        return "OrderUpdate";
    }



}
