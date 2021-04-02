package com.mypage.dao;

import java.util.List;

import com.login.dto.RegistDto;
import com.mypage.dto.PaymentDto;

public interface PaymentDao {
	
	public int paymentUpdate(RegistDto dto);
	public int paymentDowndate(RegistDto dto);
	public int paymentInsert(PaymentDto dto);
	public List<PaymentDto> paymentList();
	public List<PaymentDto> paymentListMy(String member_email);
}
