package com.mypage.biz;

import com.login.dto.RegistDto;

public interface PaymentBiz {

	public int paymentUpdate(RegistDto dto);
	public int paymentDowndate(RegistDto dto);
}
