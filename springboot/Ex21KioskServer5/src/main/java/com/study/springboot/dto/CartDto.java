package com.study.springboot.dto;

import com.study.springboot.entity.CartEntity;
import com.study.springboot.entity.ItemEntity;
import jakarta.persistence.Column;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartDto {
    private Long cartNo;
    private String cartCode;
    private String itemCode;
    private String itemName;
    private Integer itemPrice;
    private String itemImageUrl;
    private Integer cartItemAmount;
    @DateTimeFormat(pattern = "yyyy-MM-ddTHH:mm:ss")
    private LocalDateTime cartDate;

    public static CartDto toDto(CartEntity entity){
        return CartDto.builder()
                .cartNo(entity.getCartNo())
                .cartCode(entity.getCartCode())
                .itemCode(entity.getItemCode())
                .itemName(entity.getItemName())
                .itemPrice(entity.getItemPrice())
                .itemImageUrl(entity.getItemImageUrl())
                .cartItemAmount(entity.getCartItemAmount())
                .cartDate(entity.getCartDate())
                .build();
    }
}
