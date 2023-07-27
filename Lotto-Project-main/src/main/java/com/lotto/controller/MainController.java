package com.lotto.controller;

import com.lotto.domain.dto.Main;
import com.lotto.domain.dto.Shopping;
import com.lotto.domain.request.ShoppingRequest;
import com.lotto.service.MainService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Controller
public class MainController {
    private final MainService mainService;

    public MainController(MainService mainService) {
        this.mainService = mainService;
    }

    @GetMapping("/main")
    public ModelAndView showUpdatePage(
            HttpSession session,
            ModelAndView mav
    ) {
        String email = (String) session.getAttribute("email");
//        String email = "bbb";
        List<Main> shoppingList = mainService.shoppingList(email); //  장바구니 리스트
        List<Main> buyList = mainService.buyList(email);  // 구매한 리스트
        List<Main> percentList = mainService.percentList();  // 구매한 리스트

        int[] counts= new int[46]; // 인덱스 0~45까지의 배열을 만듬
        int totalNum = 0; // 총 번호의 개수
        String[] split = null; // split 배열 초기화
        for (Main main : percentList) {
            split = main.getLottoNumbers().split(","); // 로또 번호를 하나의 배열로 만듬
            for (int i = 0; i < split.length; i++) {
                counts[Integer.parseInt(split[i])]++; // 중복되는 번호는 +1해줘서 해당 번호의 개수를 구한다.
                totalNum++;
            }
        }

        double[] percentages = new double[counts.length]; // 소수까지 퍼센트를 계산하기위해 double로 배열을 만듬

        for (int i = 0; i < counts.length; i++) {
            // counts[i]를 퍼센트로 계산하고 소수점 한자리 밑으로는 버리기 위해 Math.round() 사용
            // counts[i] * 100.0 / totalNum * 10 을 반올림하고 10으로 나누어 소수로 변환
            // Math.round()는 소수점을버리기 때문에 totalNum에 10을 곱해주고 계산이 끝난뒤 10으로 나누어 다시 소수점 한자리까지 출력한다.
            percentages[i] = Math.round(counts[i] * 100.0 / totalNum * 10) / 10.0;
            // 퍼센트 계산은 값/총 값 * 100 원래 식이지만 counts,totalNUM은 int라서 값이 소수로 나오면 0으로 반환해서 100을 먼저 곱해줌
        }


        String drawDate = mainService.drawDate(); // 최신회차 받아옴
        mav.addObject("percentages", percentages);
        mav.addObject("shoppingList", shoppingList);
        mav.addObject("buyList", buyList);
        mav.addObject("drawDate", drawDate);
        mav.setViewName("/main");
        return mav;
    }

    @PostMapping("/main")
    public ModelAndView lottoShopping(
            @ModelAttribute ShoppingRequest request,
            HttpSession session,
            ModelAndView mav
    ){
        String email = (String) session.getAttribute("email");
//        String email = "bbb";

        mainService.shopping(request.todto(email));
        // request랑 session을 둘 다 사용해야되서 request에서 email도 받아서 dto로 변환함
        mav.setViewName("redirect:/main");
        return mav;
    }

}
