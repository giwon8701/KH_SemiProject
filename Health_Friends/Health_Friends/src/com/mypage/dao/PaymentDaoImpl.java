package com.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;

public class PaymentDaoImpl extends SqlMapConfig implements PaymentDao{
	
	private String namespace = "paymentmapper.";
	
	@Override
	public int paymentUpdate(RegistDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.update(namespace+"paymentUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return res;
	}
	
	
	@Override
	public int paymentDowndate(RegistDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.update(namespace+"paymentDowndate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return res;
	}


}
