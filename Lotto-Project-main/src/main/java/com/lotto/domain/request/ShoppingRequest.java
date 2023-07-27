package com.lotto.domain.request;

import com.lotto.domain.dto.Shopping;

public class ShoppingRequest {
    private String drawDate;
    private String lottoNumber;

    public ShoppingRequest(String drawDate, String lottoNumber) {
        this.drawDate = drawDate;
        this.lottoNumber = lottoNumber;
    }

    public String getDrawDate() {
        return drawDate;
    }

    public void setDrawDate(String drawDate) {
        this.drawDate = drawDate;
    }

    public String getLottoNumber() {
        return lottoNumber;
    }

    public void setLottoNumber(String lottoNumber) {
        this.lottoNumber = lottoNumber;
    }

    public Shopping todto(String email){
        return new Shopping(email,drawDate,lottoNumber);
    }
    // 받아온 email을 추가해서 dto Shopping 형식으로 바꿔준다.
}
