package com.study.springboot.controller;

import com.study.springboot.dto.*;
import com.study.springboot.entity.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Order;
import jakarta.servlet.http.HttpServletRequest;
import org.hibernate.mapping.Join;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Member;
import java.net.http.HttpRequest;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class ApiController {
    @Autowired
    private ItemRepository itemRepository;

//    @GetMapping("/itemlist-recommand")
//    @GetMapping("/itemlist-burgerset")
//    @GetMapping("/itemlist-happymeal")
//    @GetMapping("/itemlist-coffee")
//    @GetMapping("/itemlist-desert")
//    @GetMapping("/itemlist-drink")

    @GetMapping("/itemlist")
    public List<ItemDto> itemList() {

        //엔티티(리스트)는 절대 외부에 직접 반환하지 말 것.
        //엔티티를 직접 수정(setter)이 가해지면, DB도 함께 수정이 되어 버림.
        //엔티티는 직접 DB에 제어할 때만 사용하고, 데이타 전달이나 UI처리는
        //  DTO를 사용해야 된다.

        List<ItemEntity> listEntity = itemRepository.findAll();

        List<ItemDto> listDto = listEntity
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());

        return listDto; //json 문자열로 리턴이 된다.
    }


    // 메뉴 목록
    @GetMapping("/itemlistAll")
    public Map<String, List<ItemDto>> itemlistAll() {
        Map<String, List<ItemDto>> map = new HashMap<>();

        List<ItemEntity> listRecommend = itemRepository.findByItemRecommend(1);
        List<ItemDto> listDtoRecommend = listRecommend
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistRecommand", listDtoRecommend);

        List<ItemEntity> listCate1 = itemRepository.findByItemCate("버거&세트");
        List<ItemDto> listDto1 = listCate1
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistBurgerset", listDto1);

        List<ItemEntity> listCate2 = itemRepository.findByItemCate("해피밀");
        List<ItemDto> listDto2 = listCate2
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistHappymeal", listDto2);

        List<ItemEntity> listCate3 = itemRepository.findByItemCate("커피");
        List<ItemDto> listDto3 = listCate3
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistCoffee", listDto3);

        List<ItemEntity> listCate4 = itemRepository.findByItemCate("디저트");
        List<ItemDto> listDto4 = listCate4
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistDesert", listDto4);

        List<ItemEntity> listCate5 = itemRepository.findByItemCate("음료");
        List<ItemDto> listDto5 = listCate5
                .stream()
                .map(ItemDto::toDto)
                .collect(Collectors.toList());
        map.put("itemlistDrink", listDto5);

        return map; //json 문자열로 리턴이 된다.
    }

    @Autowired
    private CartRepository cartRepository;

    // 장바구니 아이템 조회
    @GetMapping("/getCartItems")
    public List<CartDto> getCartItems() {

        List<CartEntity> listEntity = cartRepository.findAll();

        List<CartDto> listDto = listEntity
                .stream()
                .map(CartDto::toDto)
                .collect(Collectors.toList());

        return listDto;
    }

    // 장바구니 아이템 저장
    @PostMapping("/setCartItems")
    public ResultDto setCartItems(@RequestBody List<CartDto> cartItems) {

        // pay.js에서 보낸 cartItems를 cartDto에 저장
        // cartDto를 cartEntity로 변환
        // 변환한 cartEntity를  cartRepository에 저장
        // cartRepository는 DB에 보여짐
        for (CartDto cartDto : cartItems) {
            CartEntity entity = CartEntity.toEntity(cartDto);
            cartRepository.save(entity);
        }

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;
    }

    // 장바구니 비우기
    @DeleteMapping("deleteCartItems")
    public ResultDto deleteCartItems() {

        cartRepository.deleteAll();

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;
    }

    @Autowired
    private OrderRepository orderRepository;

    // 주문 정보 저장
    @PostMapping("/setOrder")
    public ResultDto setOrder(@RequestBody OrderDto orderDto) {

        OrderEntity entity = OrderEntity.toEntity(orderDto);
        orderRepository.save(entity);

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;
    }

    @Autowired
    private MemberRepository memberRepository;

    // 로그인
    @PostMapping("/loginAction")
    public ResultDto loginAction(@RequestBody LoginDto loginDto,
                                 HttpServletRequest request) {
        System.out.println("loginId:" + loginDto.getLoginId());
        System.out.println("loginPw:" + loginDto.getLoginPw());


        //로그인 액션 : 아이디, 암호가 DB에 있으면 로그인 성공, 아니면 실패
        List<MemberEntity> list = memberRepository.findByMemberIdAndMemberPw(
                loginDto.getLoginId(),
                loginDto.getLoginPw()
        );

        ResultDto resultDto = null;

        if (list.size() > 0) {
            //로그인 성공
            resultDto = ResultDto.builder()
                    .status("ok")
                    .result(1)
                    .build();
            request.getSession().setAttribute("loginId", loginDto.getLoginId());
            //request.getSession().invalidate(); //로그아웃처리
        } else {
            //로그인 실패
            resultDto = ResultDto.builder()
                    .status("ok")
                    .result(0)
                    .build();
        }

        return resultDto;
    }

    // 회원 가입
    @PostMapping("/joinAction")
    public ResultDto loginAction(@RequestBody JoinDto joinDto) {
        System.out.println("loginId:" + joinDto.getLoginId());
        System.out.println("loginPw:" + joinDto.getLoginPw());
        System.out.println("loginNickname:" + joinDto.getLoginNickname());

        MemberEntity memberJoinEntity = MemberEntity.toJoinEntity(joinDto);

        //로그인 액션 : 아이디, 암호가 DB에 있으면 로그인 성공, 아니면 실패
        MemberEntity newEntity = memberRepository.save(memberJoinEntity);

        ResultDto resultDto = null;

        if (newEntity != null) {
            //회원가입 성공
            resultDto = ResultDto.builder()
                    .status("ok")
                    .result(1)
                    .build();
        } else {
            //회원가입 실패
            resultDto = ResultDto.builder()
                    .status("ok")
                    .result(0)
                    .build();
        }

        return resultDto;
    }

    // 회원 적립금 저장
    @PostMapping("/savePoint")
    public ResultDto savePoint(@RequestBody PointDto pointDto,
                               HttpServletRequest request,
                               Model model) {

        String loginId = (String) request.getSession().getAttribute("loginId");
        if (loginId != null) {
            List<MemberEntity> list = memberRepository.findByMemberId(loginId);
            if (list.size() > 0) {
                MemberEntity memberEntity = list.get(0);
                memberEntity.setMemberPoint(memberEntity.getMemberPoint() + pointDto.getMemberPoint());
                MemberEntity newEntity = memberRepository.save(memberEntity);
                System.out.println("new member point" + memberEntity.getMemberPoint());
                model.addAttribute("memberPoint", memberEntity.getMemberPoint());
            }
        }

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;

    }

    // 회원 정보 수정
    @PostMapping("/updateAction")
    // JSON 형식으로 쓰려면 Dto와 @RequsetBody 사용
    public ResultDto updateAction(@RequestBody MemberDto memberDto) {

        MemberEntity memberEntity = MemberEntity.toMemberEntity(memberDto);
        MemberEntity newEntity = memberRepository.save(memberEntity);

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;

    }

    // 상품 정보 수정
    @PostMapping("/itemUpdateAction")
    public ResultDto itemUpdateAction(@RequestBody ItemDto ItemDto) {

        ItemEntity itemEntity = ItemEntity.toEntity(ItemDto);
        ItemEntity newEntity = itemRepository.save(itemEntity);

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;
    }

    // 주문 정보 수정
    @PostMapping("/orderUpdateAction")
    public ResultDto orderUpdateAction(@RequestBody OrderDto orderDto) {

        OrderEntity orderEntity = OrderEntity.toEntity(orderDto);
        OrderEntity newEntity = orderRepository.save(orderEntity);

        ResultDto resultDto = ResultDto.builder()
                .status("ok")
                .result(1)
                .build();

        return resultDto;
    }

}
