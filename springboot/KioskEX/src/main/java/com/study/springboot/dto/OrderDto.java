package com.study.springboot.dto;

import com.study.springboot.entity.OrderEntity;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto {
    private Long orderNo;
    private String cartItemCode1;
    private String cartItemCode2;
    private String cartItemCode3;
    private String cartItemCode4;
    private String cartItemCode5;
    private Integer orderTotalPrice;
    private Integer orderTotalCount;
    private Integer orderNumber;
    private Integer orderPayType;
    private String orderState;
    @DateTimeFormat(pattern = "yyyy-MM-ddTHH:mm:ss")
    private LocalDateTime orderDatetime;

    public static OrderDto toDto(OrderEntity entity){
        return OrderDto.builder()
                .orderNo(entity.getOrderNo())
                .cartItemCode1(entity.getCartItemCode1())
                .cartItemCode2(entity.getCartItemCode2())
                .cartItemCode3(entity.getCartItemCode3())
                .cartItemCode4(entity.getCartItemCode4())
                .cartItemCode5(entity.getCartItemCode5())
                .orderTotalPrice(entity.getOrderTotalPrice())
                .orderTotalCount(entity.getOrderTotalCount())
                .orderNumber(entity.getOrderNumber())
                .orderPayType(entity.getOrderPayType())
                .orderState(entity.getOrderState())
                .orderDatetime(entity.getOrderDatetime())
                .build();
    }


}
