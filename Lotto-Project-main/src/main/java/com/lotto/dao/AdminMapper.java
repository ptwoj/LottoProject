package com.lotto.dao;

import com.lotto.domain.dto.OutUser;
import com.lotto.domain.dto.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    // 회원 정보 전체 찾기 메서드: 전체 사용자를 검색하고 반환
    List<User> findAll();

    // 회원 정보 삭제 메서드: 사용자 고유 ID 를 인자로 받아 해당 ID 를 가진 사용자를 삭제
    int delete(Integer id);

    // 회원 탈퇴 사용자 정보 저장 메서드: email 주소를 인자로 받아 해당 이메일을 가진 사용자를 outUser 테이블에 저장
    int outUserSave(Integer id);

    // 탈퇴 회원 정보 전체 찾기 메서드: 탈퇴한 전체 사용자를 검색하고 반환
    List<OutUser> findAllByOutUser();

    // 큰 금액 순으로 회원 전체 충전 금액 정보 찾기 메서드: 전체 사용자를 검색하고 큰 금액을 가진 사용자 순으로 반환
    List<User> findAllByMoney();

}
