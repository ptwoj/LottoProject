package com.lotto.dao;

import com.lotto.domain.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

// MyBatis의 Mapper 인터페이스
@Mapper
public interface UserMapper {

    // 회원가입 메서드: SignupUser 객체를 인자로 받아서 새로운 사용를 데이터베이스에 등록
    int signup(SignupUser signupUser);

    // 로그인 메서드: LoginUser 객체를 인자로 받아서 해당 정보와 일치하는 사용자를 검색하고 반환
    User login(LoginUser loginUser);

    // 로그아웃 메서드: 사용자의 고유 ID(uid)를 인자로 받아서 로그아웃을 처리
    int logout(Integer uid);

    // 사용자 정보 수정 메서드: UpdateUser 객체를 인자로 받아서 해당 사용자의 정보를 업데이트
    int update(UpdateUser updateUser);

    // 회원 탈퇴 메서드: email 주소를 인자로 받아 해당 이메일을 가진 사용자를 삭제
    int delete(String email);

    // 회원 탈퇴 사용자 정보 저장 메서드: email 주소를 인자로 받아 해당 이메일을 가진 사용자를 outUser 테이블에 저장
    int outUserSave(String email);
}
