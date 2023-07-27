package com.lotto.domain.request;

public class ChargeMoneyRequest {
    private String email;
    private int money;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public ChargeMoneyRequest(String email, int money) {
        this.email = email;
        this.money = money;
    }
}
