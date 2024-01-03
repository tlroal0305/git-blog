package com.study.springboot.entity;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartRepository extends JpaRepository<CartEntity, Long> {
    //기본함수 : findAll, findById, count, save, update

}
