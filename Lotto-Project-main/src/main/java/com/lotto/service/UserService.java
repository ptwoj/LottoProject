package com.lotto.service;

import com.lotto.dao.UserMapper;
import com.lotto.domain.dto.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    private final UserMapper userMapper;

    // UserMapper 객체를 주입 받아 사용 -> 객체를 통해 실제 데이터베이스와 상호작용 처리
    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    // 회원가입을 처리하는 메서드: SignupUser 객체를 인자로 받아서 UserMapper를 통해 데이터베이스에 사용자 정보 등록
    // 회원가입이 성공이라면 true를 반환, 아닐 시 0을 반환
    public boolean signup(SignupUser signupUser) {
        return userMapper.signup(signupUser) != 0;
    }

    // 로그인을 처리하는 메서드: LoginUser 객체를 인자로 받아서 해당 정보와 일치하는 사용자를 데이터베이스에서 조회하여 반환
    public User login(LoginUser loginUser) {
        return userMapper.login(loginUser);
    }

    // 로그아웃을 처리하는 메서드: 사용자의 고유 ID(uid)를 인자로 받아서 로그아웃을 처리
    public int logout(Integer uid) {
        return userMapper.logout(uid);
    }

    // 사용자 정보 수정 메서드: UpdateUser 객체를 인자로 받아서 해당 사용자의 정보를 업데이트용
    public int update(UpdateUser updateUser) {
        return userMapper.update(updateUser);
    }

    // 회원탈퇴 메서드: 사용자의 이메일 주소를 인자로 받아서 해당 이메일 주소를 가진 사용자를 삭제
    public int delete(String email) {
        return userMapper.delete(email);
    }

    // 회원 탈퇴 유저 저장 메서드: email 주소를 인자로 받아 해당 이메일을 가진 탈퇴 예정 사용자를 outUser Table 에 저장
    public int outUserSave(String email) {
        return userMapper.outUserSave(email);
    }
}
