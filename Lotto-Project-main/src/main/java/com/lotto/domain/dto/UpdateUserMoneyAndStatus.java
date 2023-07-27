package com.lotto.domain.dto;

import com.lotto.domain.request.BuyLottoRequest;
import com.lotto.domain.request.UpdateLottoStatusRequest;

public class UpdateUserMoneyAndStatus {
    private BuyLottoRequest buyLottoRequest;
    private UpdateLottoStatusRequest updateLottoStatusRequest;

    public UpdateUserMoneyAndStatus(String userEamil, String lottoNumbers) {
        this.buyLottoRequest = new BuyLottoRequest(userEamil);
        this.updateLottoStatusRequest = new UpdateLottoStatusRequest(userEamil, lottoNumbers);

    }

    public BuyLottoRequest getBuyLottoRequest() {
        return buyLottoRequest;
    }

    public UpdateLottoStatusRequest getUpdateLottoStatusRequest() {
        return updateLottoStatusRequest;
    }
}
