package com.lotto.domain.dto;

public class Main {
    private int id;
    private String email;
    private String lottoNumbers;
    private int drawDate;
    private Boolean status;

    public Main(int id, String email, String lottoNumbers, int drawDate, Boolean status) {
        this.id = id;
        this.email = email;
        this.lottoNumbers = lottoNumbers;
        this.drawDate = drawDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
