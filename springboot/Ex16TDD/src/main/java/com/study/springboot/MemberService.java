package com.study.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// @Service : 서비스(로직)에 해당하는 클래스
@Service
public class MemberService {
    @Autowired
    Member member;

    public int loginAction(Member member) {
        // DAO 클래스를 이용한 DB 검색
        if (member.getLoginId().equals("hong") && member.getLoginPw().equals("1234")) {
            return 1; // 로그인 성공
        } else {
            return 0; // 로그인 실패
        }
    }
}

