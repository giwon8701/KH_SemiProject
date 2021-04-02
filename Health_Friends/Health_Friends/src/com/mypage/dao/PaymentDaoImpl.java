package com.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;
import com.mypage.dto.IndividualDto;
import com.mypage.dto.PaymentDto;

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
	
	public int paymentInsert(PaymentDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			System.out.println(dto);
			res = session.insert(namespace+"paymentInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return res;
	}

	public List<PaymentDto> paymentList() {
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList(namespace+"paymentList");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public List<PaymentDto> paymentListMy(String member_email){
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList(namespace+"paymentListMy", member_email);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	@Override
	public List<PaymentDto> paymentListPaging(int startRow, int endRow) {
		
		List<PaymentDto> list = new ArrayList<PaymentDto>();
		endRow += startRow;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println("다오"+map);
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList(namespace+"paymentListPaging", map);
			System.out.println("다오"+list);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public int getTotalCount() {
		SqlSession session = null;

		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace+"getTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return res;
	}


}
