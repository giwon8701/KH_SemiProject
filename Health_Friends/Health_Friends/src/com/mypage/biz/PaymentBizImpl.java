package com.mypage.biz;

import java.util.List;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;
import com.mypage.dao.PaymentDao;
import com.mypage.dao.PaymentDaoImpl;
import com.mypage.dto.PaymentDto;

public class PaymentBizImpl extends SqlMapConfig implements PaymentBiz {

	
	PaymentDao dao = new PaymentDaoImpl();
	
	@Override
	public int paymentUpdate(RegistDto dto) {
		return dao.paymentUpdate(dto);
	}

	@Override
	public int paymentDowndate(RegistDto dto) {
		return dao.paymentDowndate(dto);
	}

	@Override
	public int paymentInsert(PaymentDto dto) {
		return dao.paymentInsert(dto);
	}

	@Override
	public List<PaymentDto> paymentList() {
		return dao.paymentList();
	}

	@Override
	public List<PaymentDto> paymentListMy(String member_email) {
		return dao.paymentListMy(member_email);
	}

	@Override
	public List<PaymentDto> paymentListPaging(int startRow, int endRow) {
		return dao.paymentListPaging(startRow, endRow);
	}

	@Override
	public int getTotalCount() {
		return dao.getTotalCount();
	}

	
}
