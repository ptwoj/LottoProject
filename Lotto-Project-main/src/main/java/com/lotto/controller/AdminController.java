package com.lotto.controller;

import com.lotto.domain.dto.OutUser;
import com.lotto.domain.dto.User;
import com.lotto.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller

// /admin 시작하는 URL 요청에 대해 해당 클레스에서 처리
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    // AdminService 객체를 주입 받아 사용 -> 객체를 통해 실제 데이터베이스와 상호작용 처리
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    // 어드민 메인 페이지 반환 메서드
    @GetMapping("/main")
    public String getMainPage() {
        return "/admin/adminMain";
    }

    // 회원 정보 삭제 페이지 반환 메서드
    @GetMapping("/delete")
    public String getUserListPage(
            Model model) {

        List<User> userList = adminService.findAll();
        model.addAttribute("userList", userList);

        return "/admin/adminDelete";
    }

    // 회원 정보 삭제를 처리하는 메서드
    @GetMapping("/delete/{id}")
    public ModelAndView outUserSave(
            ModelAndView mav,
            @PathVariable("id") Integer id
    ) {
        // 세션에서 사용자 email 을 가져와 email 에 저장

        List<User> userList = adminService.findAll();
        mav.addObject("userList", userList);
        // userService.outUserSave(email)를 호출하여 탈퇴 회원 데이터베이스에 저장
        adminService.outUserSave(id);

        // userService.delete(email)를 호출하여 회원가입 처리 및 세션 무효화
        adminService.delete(id);

        mav.setViewName("redirect:/admin/main");
        return mav;
    }


    // 탈퇴 회원 정보 리스트 페이지 반환 메서드
    @GetMapping("/outUser")
    public String getOutUserList(
            Model model
    ) {
        List<OutUser> outUserList = adminService.findAllByOutUser();
        model.addAttribute("outUserList", outUserList);

        return "/admin/outUserList";
    }

    // 큰 금액을 가진 유저 순으로 회원 리스트 페이지 반환 메서드
    @GetMapping("/userMoneyList")
    public String getUserMoneyListPage(
            Model model) {

        List<User> userList = adminService.findAllByMoney();
        model.addAttribute("userList", userList);

        return "/admin/userMoneyList";
    }

}
