package com.lotto.service;

import com.lotto.dao.ShoppingMapper;
import com.lotto.domain.dto.Main;
import com.lotto.domain.dto.Shopping;
import com.lotto.domain.request.ShoppingRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainService    {
    @Autowired
    private ShoppingMapper shoppingMapper;

    public int shopping(Shopping shopping) {
        return shoppingMapper.lottoShopping(shopping);
    }

    public List<Main> shoppingList(String email){
        return shoppingMapper.shoppingList(email);
    }
    public List<Main> percentList(){
        return shoppingMapper.percentList();
    }
    public List<Main> buyList(String email){
        return shoppingMapper.buyList(email);
    }
    public String drawDate(){
        return shoppingMapper.latestDrawDate();
    };
}
