package com.lotto.dao;

import com.lotto.domain.dto.LottoNumber;
import com.lotto.domain.request.ChargeMoneyRequest;
import com.lotto.domain.request.UpdateLottoStatusRequest;
import com.lotto.domain.request.BuyLottoRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuyMapper {

    /**
     * 이메일로 로또 번호를 조회.
     *
     * @param email 이메일
     * @return 조회된 로또 번호 리스트
     */
    List<LottoNumber> findByEmail(String email);

    /**
     * 사용자의 돈을 업데이트.
     *
     * @param money 구매 로또 요청 객체
     */
    void updateUserMoney(BuyLottoRequest money);

    /**
     * 로또 상태를 업데이트.
     *
     * @param status 로또 상태 업데이트 요청 객체
     */
    void updateLottoStatus(UpdateLottoStatusRequest status);

    /**
     * 사용자에게 돈을 충전.
     *
     * @param request 돈 충전 요청 객체
     */
    void chargeMoney(ChargeMoneyRequest request);

    /**
     * 사용자의 돈을 조회.
     *
     * @param email 이메일
     * @return 사용자의 돈
     */
    int findMoney(String email);
}
