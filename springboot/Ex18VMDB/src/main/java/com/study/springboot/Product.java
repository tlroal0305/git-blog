package com.study.springboot;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table ( name = "product" )

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // 기본키
    private String name;
    private int price;
    private String date;
}
