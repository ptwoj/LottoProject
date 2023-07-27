package com.lotto.domain.request;

public class UpdateLottoStatusRequest {
    private String email;
    private String lottoNumbers;

    public UpdateLottoStatusRequest(String email, String lottoNumbers) {
        this.email = email;
        this.lottoNumbers = lottoNumbers;
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
}
