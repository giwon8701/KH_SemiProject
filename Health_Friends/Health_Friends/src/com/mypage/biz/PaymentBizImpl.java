package com.mypage.biz;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;
import com.mypage.dao.PaymentDao;
import com.mypage.dao.PaymentDaoImpl;

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

}
