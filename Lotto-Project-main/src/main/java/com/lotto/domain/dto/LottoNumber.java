package com.lotto.domain.dto;

public class LottoNumber {
    private Integer id;
    private String email;
    private String lottoNumbers;
    private int drawDate;
    private boolean status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLottoNumbers() {
        return lottoNumbers;
    }

    public void setLottoNumbers(String lottoNumbers) {
        this.lottoNumbers = lottoNumbers;
    }

    public int getDrawDate() {
        return drawDate;
    }

    public void setDrawDate(int drawDate) {
        this.drawDate = drawDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public LottoNumber(Integer id, String email, String lottoNumbers, int drawDate, boolean status) {
        this.id = id;
        this.email = email;
        this.lottoNumbers = lottoNumbers;
        this.drawDate = drawDate;
        this.status = status;
    }
}
