package com.lotto.service;

import com.lotto.dao.WinningNumberMapper;
//import com.lotto.domain.dto.ResultDto;
import com.lotto.domain.dto.ResultNumber;
//import com.lotto.domain.dto.WinningNumber;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class WinningNumberService {
    private final WinningNumberMapper winningNumberMapper;

    public WinningNumberService(WinningNumberMapper winningNumberMapper) {
        this.winningNumberMapper = winningNumberMapper;
    }

    public String findByDraw(int drawDate) {
        return winningNumberMapper.findByDraw(drawDate);
    }


    public List<ResultNumber> findAll() {
        return winningNumberMapper.findAll();
    }

}