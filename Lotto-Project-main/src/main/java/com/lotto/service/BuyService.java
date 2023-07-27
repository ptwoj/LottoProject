package com.lotto.service;

import com.lotto.dao.BuyMapper;
import com.lotto.domain.dto.LottoNumber;
import com.lotto.domain.dto.UpdateUserMoneyAndStatus;
import com.lotto.domain.request.ChargeMoneyRequest;
import com.lotto.domain.request.UpdateLottoStatusRequest;
import com.lotto.domain.request.BuyLottoRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BuyService {
    private final BuyMapper buyMapper;

    @Autowired
    public BuyService(BuyMapper buyMapper) {
        this.buyMapper = buyMapper;
    }

    /**
     * 이메일로 로또 번호를 조회.
     *
     * @param email 이메일
     * @return 조회된 로또 번호 리스트
     */
    public List<LottoNumber> findByEmail(String email) {
        return buyMapper.findByEmail(email);
    }

    /**
     * 사용자의 돈과 로또 상태를 업데이트.
     *
     * @param updateUserMoneyAndStatus 사용자 돈 및 로또 상태 업데이트 정보 객체
     * @return 돈 및 상태 업데이트 성공 여부 (true: 업데이트 성공, false: 돈이 부족하여 업데이트 실패)
     */
    public boolean updateMoneyAndStatus(UpdateUserMoneyAndStatus updateUserMoneyAndStatus) {
        int money = buyMapper.findMoney(updateUserMoneyAndStatus.getBuyLottoRequest().getEmail());
        if (money <= 0) {
            return false;
        } else {
            buyMapper.updateUserMoney(updateUserMoneyAndStatus.getBuyLottoRequest());
            buyMapper.updateLottoStatus(updateUserMoneyAndStatus.getUpdateLottoStatusRequest());
        }
        return true;
    }

    /**
     * 사용자에게 돈을 충전.
     *
     * @param chargeMoneyRequest 돈 충전 요청 객체
     */
    public void chargeMoney(ChargeMoneyRequest chargeMoneyRequest) {
        buyMapper.chargeMoney(chargeMoneyRequest);
    }

    /**
     * 사용자의 돈을 조회.
     *
     * @param email 이메일
     * @return 사용자의 돈
     */
    public int findMoney(String email) {
        return buyMapper.findMoney(email);
    }
}
