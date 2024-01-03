package com.study.springboot;

import org.junit.jupiter.api.*;

public class LifeCycleTest {
    //@Test
    //  테스트 메소드 임을 알려줌. 테스트 케이스에는 반드시 사용해야 됨.
    //@DisplayName
    //  테스트 클래스나 테스트 메소드에 이름을 붙여줄 때 사용한다.
    @Test
    @DisplayName("테스트 코드1")
    void TestMethod1(){
        System.out.println("테스트 코드1");
    }
    @Test
    @DisplayName("테스트 코드2")
    void TestMethod2(){
        System.out.println("테스트 코드2");
    }
    //@Disabled
    //  메소드 비활성화 함.
    @Test
    @DisplayName("테스트 코드3 - 비활성화")
    @Disabled
    void TestMethod3(){
        System.out.println("테스트 코드3");
    }

    //@BeforeAll
    //  테스트 Class 기준으로 테스트 메서드들이 실행되기전 한번 실행
    //  JUnit4의 @BeforeClass 역할, static 사용
    @BeforeAll
    static void beforeAll(){
        //테스트 전에 값의 초기화
        System.out.println("beforeAll");
    }
    //@AfterAll
    //  테스트 Class 기준으로 테스트 메서드들이 실행된 후 실행
    //  JUnit4의 @AfterClass 역할, static 사용
    @AfterAll
    static void afterAll(){
        //자원 정리
        System.out.println("afterAll");
    }
    //@BeforeEach
    //  각 테스트 메서드가 실행되기전 실행
    //  JUnit4의 @Before 역할
    @BeforeEach
    void beforeEach(){
        System.out.println("beforeEach");
    }
    //@AfterEach
    //  각 테스트 메서드가 실행된 후 실행
    //  JUnit4의 @After 역할
    @AfterEach
    void afterEach(){
        System.out.println("afterEach");
    }
}
