package com.lotto.controller;

//import com.lotto.domain.dto.ResultDto;
//import com.lotto.domain.dto.ResultNumber;
//import com.lotto.domain.dto.WinningNumber;
import com.lotto.service.WinningNumberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/lotto")
public class WinningNumberController {

    private final WinningNumberService winningNumberService;

    public WinningNumberController(WinningNumberService winningNumberService) {
        this.winningNumberService = winningNumberService;
    }

    @GetMapping("/winningnumber")
    public String getWinningNumberPage() {
        return "/lotto/winningnumber";
    }



    @PostMapping("/winningnumber")
    public ModelAndView postResultPage(ModelAndView mav, @RequestParam("drawDate") int drawDate) {
        mav.setViewName("redirect:/lotto/result");
        mav.addObject("drawDate", drawDate);
        return mav;
    }

    @GetMapping("/result")
    public String getResultPage(Model model,
                                @RequestParam("drawDate") int drawDate
                                ,@RequestParam("takeLottoNumber") String takeLottoNumber
                                ) {
//        String takeLottoNumber = "2,3,4,5,6,7";
        String winningNumbers = winningNumberService.findByDraw(drawDate);



        String[] numbers1 = takeLottoNumber.split(",");
        String[] numbers2 = winningNumbers.split(",");


        Set<String> set1 = new HashSet<>(Arrays.asList(numbers1));
        Set<String> set2 = new HashSet<>(Arrays.asList(numbers2));

        set1.retainAll(set2);

        String commonNumbers = String.join(",", set1);

        String[] numberArray = commonNumbers.split(",");
        int count = numberArray.length;
        String rank = null;
        if(count == 6){
            rank = "1등";
        }else if(count == 5){
            rank = "2등";
        }else if(count == 4){
            rank = "3등";
        }else if(count == 3){
            rank = "4등";
        }else if(count == 2){
            rank = "낙첨되었습니다.";
        }else if(count == 1){
            rank = "낙첨되었습니다.";
        }else if(count == 0){
            rank = "낙첨되었습니다.";
            commonNumbers = "일치되는 번호가 없습니다.";
        }


        model.addAttribute("winningNumbers", winningNumbers);
        model.addAttribute("drawDate", drawDate);
        model.addAttribute("takeLottoNumber", takeLottoNumber);
        model.addAttribute("commonNumbers", commonNumbers);
        model.addAttribute("rank", rank);
        return "/lotto/result";
    }


}
