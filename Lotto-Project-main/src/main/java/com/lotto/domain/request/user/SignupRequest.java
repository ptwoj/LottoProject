package com.lotto.domain.request.user;

import com.lotto.domain.dto.SignupUser;
import com.lotto.domain.dto.User;

// 회원가입 요청을 처리하기 위한 클래스
public class SignupRequest {
    private String email;
    private String password;
    private String name;

    public SignupRequest(String email, String password, String name) {
        this.email = email;
        this.password = password;
        this.name = name;
    }

    // SignupUser 객체로 변환하는 메서드: 사용자 회원가입 정보를 담는 DTO 클래스를 사용하여 실제 회원가입 기능 처리
    public SignupUser toDto() {
        return new SignupUser(email, password, name);
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }
}
