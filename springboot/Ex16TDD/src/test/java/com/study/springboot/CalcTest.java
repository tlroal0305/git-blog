package com.study.springboot;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

//단정함수(Assert)를 통해, 메소드 4개가 정상적으로 동작하는지
//테스트하시오.
//@DisplayName("덧셈 테스트")
//AssertEquals 또는 AssertTure함수를 이용하시오.
class CalcTest {

    Calc calc = new Calc();
    @Test
    @DisplayName("덧셈 테스트")
    void testAdd() {
        assertEquals(12, calc.add(10, 2));
    }
    @Test
    @DisplayName("뺄셈 테스트")
    void testSub() {
        assertEquals(8, calc.sub(10, 2));
    }
    @Test
    @DisplayName("곱셈 테스트")
    void testMul() {
        assertEquals(20, calc.mul(10, 2));
    }
    @Test
    @DisplayName("나눗셈 테스트")
    void testDiv() {
        assertEquals(5, calc.div(10, 2));
    }
}