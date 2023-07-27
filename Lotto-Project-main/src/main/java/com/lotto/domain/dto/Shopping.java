package com.lotto.domain.dto;

public class Shopping {
    private String email;
    private String drawDate;
    private String lottoNumber;

    public Shopping(String email, String drawDate, String lottoNumber) {
        this.email = email;
        this.drawDate = drawDate;
        this.lottoNumber = lottoNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
