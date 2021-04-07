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
	
	public List<PaymentDto> paymentListPaging(int startRow, int endRow);
	public List<PaymentDto> paymentListMyPaging(String member_email, int startRow, int endRow);
	public int getTotalCount(); 
	public int getMyTotalCount(String member_email);
}
