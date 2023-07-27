package com.lotto.domain.dto;

public class ResultNumber {
    private int id;
    private int draw_date;
    private String winning_numbers;



    public ResultNumber(int id, int draw_date, String winning_numbers) {
        this.id = id;
        this.draw_date = draw_date;
        this.winning_numbers = winning_numbers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDraw_date() {
        return draw_date;
    }

    public void setDraw_date(int draw_date) {
        this.draw_date = draw_date;
    }

    public String getWinning_numbers() {
        return winning_numbers;
    }

    public void setWinning_numbers(String winning_numbers) {
        this.winning_numbers = winning_numbers;
    }
}

