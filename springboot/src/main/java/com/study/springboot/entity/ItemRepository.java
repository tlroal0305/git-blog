package com.study.springboot.entity;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<ItemEntity, Long> {
    //기본함수 : findAll, findById, count, save, update

    // select * from item where item_recommend = ?
    List<ItemEntity> findByItemRecommend(int recommend);
    // select * from item where item_cate = ?
    List<ItemEntity> findByItemCate(String category);
}
