package com.lotto.domain.request.user;

import com.lotto.domain.dto.UpdateUser;

// 유저 정보를 수정을 처리하기 위한 클래
public class UpdateRequest {
    private String password;
    private String name;


    // UpdateUser 객체로 변환하는 메서드: 사용자에 대한 수정할 정보를 담는 DTO 클래스를 사용하여 실제 유저 정보 수정 기능 처리
    public UpdateUser toDto(Integer uid) {
        return new UpdateUser(uid, password, name);
    }

    public UpdateRequest(String password, String name) {
        this.password = password;
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }
}
