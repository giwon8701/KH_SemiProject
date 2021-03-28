package com.mypage.dao;

import com.login.dto.RegistDto;

public interface PaymentDao {
	
	public int paymentUpdate(RegistDto dto);
	public int paymentDowndate(RegistDto dto);

}
