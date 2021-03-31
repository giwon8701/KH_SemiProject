package com.mypage.biz;

import java.util.List;

import com.login.dto.RegistDto;
import com.mypage.dto.PaymentDto;

public interface PaymentBiz {

	public int paymentUpdate(RegistDto dto);
	public int paymentDowndate(RegistDto dto);
	public int paymentInsert(PaymentDto dto);
	public List<PaymentDto> paymentList();
}
