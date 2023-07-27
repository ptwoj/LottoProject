package com.lotto.service;

import com.lotto.dao.AdminMapper;
import com.lotto.domain.dto.OutUser;
import com.lotto.domain.dto.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminService {

    private final AdminMapper adminMapper;

    // AdminMapper 객체를 주입 받아 사용 -> 객체를 통해 실제 데이터베이스와 상호작용 처리
    public AdminService(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    // 전체 회원 정보 찾기 메서드: 전체 회원 정보 리스트 반환
    public List<User> findAll() {
        return adminMapper.findAll();
    }

    // 회원 정보 삭제 메서드: 회원 고유 ID 를 인자로 받아서 해당 ID를 가진 사용자를 삭제
    public int delete(Integer id) {
        return adminMapper.delete(id);
    }

    // 회원 탈퇴 유저 저장 메서드: 회원 고유 ID 를 인자로 받아 해당 ID를 가진 탈퇴 예정 사용자를 outUser Table 에 저장
    public int outUserSave(Integer id) {
        return adminMapper.outUserSave(id);
    }

    // 전체 탈퇴 회원 정보 찾기 메서드: 전체 탈퇴 회원 정보 리스트 반환
    public List<OutUser> findAllByOutUser() {
        return adminMapper.findAllByOutUser();
    }

    // 전체 회원 정보를 큰 금액을 가진 사용자 순으로 찾기 메서드: 전체 회원 정보 리스트 반환
    public List<User> findAllByMoney() {
        return adminMapper.findAllByMoney();
    }

}
