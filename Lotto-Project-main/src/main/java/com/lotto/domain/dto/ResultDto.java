package com.lotto.domain.dto;


public class ResultDto {
    private String email;
    private int drawDate;

    public ResultDto(String email, int drawDate) {
        this.email = email;
        this.drawDate = drawDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDrawDate() {
        return drawDate;
    }

    public void setDrawDate(int drawDate) {
        this.drawDate = drawDate;
    }
}