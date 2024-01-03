package com.study.springboot.controller;

import com.study.springboot.dto.ItemDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.entity.*;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class MainController {

    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private ItemRepository itemRepository;

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
    public String addItem(){
        return "AddItem";
    }
    @GetMapping("/Thanks")
    public String thanks(Model model, HttpServletRequest request){

        String loginId = (String)request.getSession().getAttribute("loginId");
        if( loginId != null ){
            List<MemberEntity> list = memberRepository.findByMemberId(loginId);
            if( list.size() > 0 ){
                MemberEntity memberEntity = list.get(0);
                model.addAttribute("point", memberEntity.getMemberPoint());
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

    @GetMapping("/adminMember")
    public String adminMember(Model model){

        List<MemberEntity> listEntity = memberRepository.findAll();

        List<MemberDto> listDto = listEntity
            .stream()
            .map(MemberDto::toDto)
            .collect(Collectors.toList());

        model.addAttribute("count", listDto.size());
        model.addAttribute("list", listDto);

        return "adminMember";
    }
    @GetMapping("/adminMemberUpdate")
    public String adminMemberUpdate(@RequestParam String memberNo, Model model){

        MemberEntity memberEntity = memberRepository.findById(Long.valueOf(memberNo)).get();

        MemberDto memberDto = MemberDto.toDto(memberEntity);
        model.addAttribute("member", memberDto);

        return "adminMemberUpdate";
    }
    @GetMapping("/adminItem")
    public String adminItem(Model model){

        List<ItemEntity> listEntity = itemRepository.findAll();

        List<ItemDto> listDto = listEntity
            .stream()
            .map(ItemDto::toDto)
            .collect(Collectors.toList());

        model.addAttribute("count", listDto.size());
        model.addAttribute("list", listDto);

        return "adminItem";
    }
    @GetMapping("/adminItemUpdate")
    public String adminItemUpdate(@RequestParam String itemNo, Model model){

        ItemEntity itemEntity = itemRepository.findById(Long.valueOf(itemNo)).get();

        ItemDto itemDto = ItemDto.toDto(itemEntity);
        model.addAttribute("item", itemDto);

        return "adminItemUpdate";
    }


}
