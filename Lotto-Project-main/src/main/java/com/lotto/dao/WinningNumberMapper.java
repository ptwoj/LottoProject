package com.lotto.dao;

import com.lotto.domain.dto.ResultDto;
import com.lotto.domain.dto.ResultNumber;
//import com.lotto.domain.dto.WinningNumber;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface WinningNumberMapper {
    String findByDraw(int drawDate);
    List<ResultNumber> userLottoNumber(ResultDto resultDto);

    List<ResultNumber> findAll();
}


