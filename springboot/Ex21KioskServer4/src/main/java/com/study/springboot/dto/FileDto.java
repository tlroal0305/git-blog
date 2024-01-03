package com.study.springboot.dto;

import com.study.springboot.entity.ItemEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.File;

@Builder
@Data
// 생성자
@AllArgsConstructor
@NoArgsConstructor
public class FileDto {
    private String uuid;
    private String fileName;

    public static FileDto toFileDto(ItemEntity itemEntity){
        return FileDto.builder()
                .fileName(itemEntity.getItemImageUrl())
                .build();
    }
}
