package com.study.springboot.dto;

import com.study.springboot.entity.ItemEntity;
import com.study.springboot.entity.MemberEntity;
import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ItemDeleteDto {
    private Long itemNo;

    public static ItemDeleteDto toDto(ItemEntity entity){
        return ItemDeleteDto.builder()
            .itemNo(entity.getItemNo())
            .build();
    }
}
