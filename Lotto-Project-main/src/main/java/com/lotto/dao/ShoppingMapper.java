package com.lotto.dao;

import com.lotto.domain.dto.Main;
import com.lotto.domain.dto.Shopping;
import com.lotto.domain.request.ShoppingRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShoppingMapper {
    int lottoShopping(Shopping shopping);
    List<Main> shoppingList(String email);
    List<Main> buyList(String email);
    List<Main> percentList();
    String latestDrawDate();

}
