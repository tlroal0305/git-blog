package com.study.springboot.entity;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
    //기본함수 : findAll, findById, count, save, update

}
