package com.lotto.controller;

import com.lotto.domain.dto.*;
import com.lotto.domain.request.user.LoginRequest;
import com.lotto.domain.request.user.SignupRequest;
import com.lotto.domain.request.user.UpdateRequest;
import com.lotto.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller

// /user로 시작하는 URL 요청에 대해 해당 클레스에서 처리
@RequestMapping("/user")
public class UserController {

    private final UserService userService;

    // UserService 객체를 주입 받아 사용 -> 객체를 통해 실제 데이터베이스와 상호작용 처리
    public UserController(UserService userService) {
        this.userService = userService;
    }


    // 회원가입 페이지 반환 메서드
    @GetMapping("/signup")
    public String getSignupPage() {
        return "/user/signup";
    }

    // 회원가입을 처리하는 메서드
    @PostMapping("/signup")
    public ModelAndView signup(
            @ModelAttribute SignupRequest request,
            ModelAndView modelAndView
    ) {
        // 회원가입 데이터를 SignupRequest 객체로부터 추출하여
        // userService.signup(dto)를 호출하여 회원가입 처리
        SignupUser dto = request.toDto();

        // 회원가입이 성공하면 로그인 페이지로 리다이렉트
        if (userService.signup(dto)) {
            modelAndView.setViewName("redirect:/user/login");

            // 회원가입이 실패하면 다시 회원가입 페이지로 리다이렉트
        } else {
            modelAndView.setViewName("redirect:/user/signup");
        }

        return modelAndView;
    }

    // 로그인 페이지를 반환하는 메서드
    @GetMapping("/login")
    public String getLoginPage() {
        return "/user/login";
    }

    // 로그인 처리를 하는 메서드
    @PostMapping("/login")
    public ModelAndView login(
            @ModelAttribute LoginRequest request,
            ModelAndView modelAndView,
            HttpSession session
    ) {

        // 로그인 데이터를 LoginRequest 객체로부터 추출
        LoginUser dto = request.toDto();

        // userService.login(dto)를 호출하여 로그인 처리
        User login = userService.login(dto);

        // 로그인이 성공하면
        if (login != null) {
            // 로그인한 사용자의 ID를 가져와 세션에 저장 -> 이후에 다른 페이지에서도 사용 가능
            session.setAttribute("id", login.getId());

            // 로그인한 사용자의 email 을 가져와 세션에 저장 -> 이후에 다른 페이지에서도 사용 가능
            session.setAttribute("email", login.getEmail());

            // 로그인한 사용자의 이름을 가져와 세션에 저장 -> 이후에 다른 페이지에서도 사용 가능
            session.setAttribute("name", login.getName());

            // 로그인한 사용자의 잔액을 가져와 세션에 저장 -> 이후에 다른 페이지에서도 사용 가능
            session.setAttribute("money", login.getMoney());


            // 로그인 사용자가 admin 이면 admin 페이지로 리다이렉트
            if (login.getEmail().equals("admin@admin.com")) {
                modelAndView.setViewName("redirect:/admin/main");
            } else {
                // 메인 페이지로 리다이렉트
                modelAndView.setViewName("redirect:/main");
            }

            // 로그인 실패 시 다시 로그인 페이지로 리다이렉트
        } else {

            modelAndView.setViewName("redirect:/user/login");
        }

        return modelAndView;
    }

    // 로그아웃을 처리하는 메서드
    @GetMapping("/logout")
    public String logout(HttpSession session) {

        // 세션에서 사용자 ID를 가져와서 uid에 저장
        Integer uid = (Integer) session.getAttribute("id");

        // uid가 존재하면, 세션 무효화
        if (uid != null) {
            session.invalidate();
        }
        return "redirect:/user/login";
    }

    //     회원 탈퇴를 처리하는 메서드
    @GetMapping("/delete")
    public ModelAndView outUserSave(
            ModelAndView mav,
            HttpSession session
    ) {
        // 세션에서 사용자 email 을 가져와 email 에 저장
        String email = (String) session.getAttribute("email");

        // userService.outUserSave(email)를 호출하여 탈퇴 회원 데이터베이스에 저장
        userService.outUserSave(email);

        // userService.delete(email)를 호출하여 회원가입 처리 및 세션 무효화
        userService.delete(email);
        session.invalidate();


        mav.setViewName("redirect:/");
        return mav;
    }


    // 유저 정보 수정 페이지 반환 메서드
    @GetMapping("/update")
    public ModelAndView getUpdatePage(
            HttpSession session,
            ModelAndView mav
    ) {
        mav.setViewName("/user/userUpdate");
        mav.addObject("name", session.getAttribute("name"));
        mav.addObject("email", session.getAttribute("email"));
        return mav;
    }


    // 유저 정보 수정을 처리하는 메서드
    @PostMapping("/update")
    public ModelAndView update(
            @ModelAttribute UpdateRequest request,
            HttpSession session,
            ModelAndView mav
    ) {


        // 세션에서 사용자 ID(uid) 을 가져와 uid에 저장
        Integer uid = (Integer) session.getAttribute("id");

        // 회원가입 데이터를 UpdateRequest 객체로부터 추출
        UpdateUser dto = request.toDto(uid);

        // uid가 존재할 시,
        if (uid != null) {
            // userService.update(dto)를 호출하여 유저 정보 수정 처리
            userService.update(dto);

        }
        // 존재 안 할 시, 콘솔로 출력
        else {
            System.out.println("uid = " + uid);
        }

        mav.setViewName("redirect:/");
        return mav;
    }


}
