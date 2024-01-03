package com.study.springboot;

//단정(Assert) 메서드 : 테스트 케이스의 수행 결과를 판별하는 용도로 사용.
//종류
//assertArrayEquals(a, b) : 배열 a와 b가 일치함을 확인한다.
//assertEquals(a, b) : 객체 a와 b가 일치함을 확인한다. (객체에 정의되어 있는 equals를 통해 비교한다.)
//assertSame(a, b) : 객체 a와 b 가 같은 객체임을 확인 한다. (객체 자체를 비교한다. == )
//assertTrue(a) : 조건 a가 참인지를 확인한다.
//assertFalse(a) : 조건 a가 거짓인지를 확인한다.
//assertNotNull(a) : 객체 a가 null인지 확인한다.
//assertAll() : 모든 종류의 assert를 각각 다 실행한다. 중간에 멈추지 않음.

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

//main폴더의 테스트 메소드
class Adder{
    public int add(int a , int b){
        return a + b;
    }
}
public class AssertTest {
    private final Adder adder = new Adder();
    private final String[] arr1 = {"a", "b"};
    private final String[] arr2 = {"c", "d"};

    @Test
    void assertArrayEqualsTest(){
        assertArrayEquals( arr1, arr2 );  //fail이면 단위테스트 정지!
        assertArrayEquals( arr1, arr1 );  //pass

        System.out.println("테스트 통과!");
    }
    @Test
    void assertEqualsTest(){
        //값비교
        assertEquals(3, adder.add(1, 2)); //pass
        assertEquals(4, adder.add(2, 2)); //pass
        assertEquals(5, adder.add(2, 4)); //fail
    }
    @Test
    void assertSameTest(){
        //주소값 비교
        assertSame(adder, adder); //pass
        assertSame(adder, arr1); //fail
    }
    @Test
    void assertTrueTest(){
        assertTrue( 10 < 20 ); //pass  //boolean값이 true일때 pass
        assertTrue( 3 == adder.add(1, 2));
        //assertTrue( 10 > 20 ); //fail
    }
    @Test
    void assertFalseTest(){
        assertFalse( 10 > 20 ); //boolean값이 false일때 pass
        assertFalse( 3 == adder.add(1, 2)); //fail
    }
    @Test
    void assertNotNullTest(){
        // 객체가 null이면 fail
        assertNotNull( adder ); //pass
        assertNotNull( null ); //fail
    }
    @Test
    void assertAllTest(){
        //assertAll : 여러 테스트케이스를 한번에 테스트할 때
        assertAll(
            //람다식 리스트
            () -> assertFalse(false, "Exception!"),
            () -> {
                Object testObj = new Object();
                assertNotNull(testObj, "not null");
            }
        );
    }
}
