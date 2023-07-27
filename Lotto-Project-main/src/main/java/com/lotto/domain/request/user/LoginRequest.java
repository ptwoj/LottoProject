package com.lotto.domain.request.user;

import com.lotto.domain.dto.LoginUser;

import javax.servlet.http.Cookie;

// 로그인 요청을 처리하기 위한 클래스
public class LoginRequest {

    private String email;
    private String password;

    public LoginRequest(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // LoginUser 객체로 변환하는 메서드: 사용자 로그인 정보를 담는 DTO 클래스를 사용하여 실제 로그인 기능 처리
    public LoginUser toDto() {
        return new LoginUser(email, password);
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }
}
