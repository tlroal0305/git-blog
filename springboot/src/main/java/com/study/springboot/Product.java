package com.study.springboot;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Entity
@Table(name = "product")
@Builder
@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;           //기본키
    private String name; // 상품명
    private int price; // 가격
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate limit_date; // 유통기한
}
