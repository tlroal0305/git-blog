package com.study.springboot.entity;

import com.study.springboot.dto.OrderDto;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Table(name="`order`")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_no")
    private Long orderNo;
    @Column(name = "cart_item_code_1")
    private String cartItemCode1;
    @Column(name = "cart_item_code_2")
    private String cartItemCode2;
    @Column(name = "cart_item_code_3")
    private String cartItemCode3;
    @Column(name = "cart_item_code_4")
    private String cartItemCode4;
    @Column(name = "cart_item_code_5")
    private String cartItemCode5;
    @Column(name = "order_total_price")
    private Integer orderTotalPrice;
    @Column(name = "order_total_count")
    private Integer orderTotalCount;
    @Column(name = "order_number")
    private Integer orderNumber;
    @Column(name = "order_pay_type")
    private Integer orderPayType;
    @Column(name = "order_state")
    private String orderState;
    @Column(name = "order_datetime")
    @DateTimeFormat(pattern = "yyyy-MM-ddTHH:mm:ss")
    private LocalDateTime orderDatetime;

    public static OrderEntity toEntity(OrderDto dto){
        return OrderEntity.builder()
                .orderNo(dto.getOrderNo())
                .cartItemCode1(dto.getCartItemCode1())
                .cartItemCode2(dto.getCartItemCode2())
                .cartItemCode3(dto.getCartItemCode3())
                .cartItemCode4(dto.getCartItemCode4())
                .cartItemCode5(dto.getCartItemCode5())
                .orderTotalPrice(dto.getOrderTotalPrice())
                .orderTotalCount(dto.getOrderTotalCount())
                .orderNumber(dto.getOrderNumber())
                .orderPayType(dto.getOrderPayType())
                .orderState(dto.getOrderState())
                .orderDatetime(dto.getOrderDatetime())
                .build();
    }
}
