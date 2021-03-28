package com.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.mypage.dto.IndividualDto;

public class IndividualDaoImpl extends SqlMapConfig implements IndividualDao {

	private String namespace = "individualmapper.";
	


	@Override
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd) {
		SqlSession session = null;
		List<IndividualDto> list = new ArrayList<IndividualDto>();
		Map<String, String> map = new HashMap<>();
		
		map.put("individual_id", individual_id);
		map.put("yyyyMMdd", yyyyMMdd);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("individualmapper.individualList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return list;
	}

	
	
	@Override
	public IndividualDto individualSelectOne(int individual_no) {
		SqlSession session = null;

		IndividualDto dto = new IndividualDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne(namespace+"individualSelectOne", individual_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return dto;
	}
	
	
	
	@Override
	public int individualInsert(IndividualDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.insert(namespace+"individualInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	@Override
	public int individualUpdate(IndividualDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.update(namespace+"individualUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	@Override
	public int individualDelete(int individual_no) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.delete(namespace+"individualDelete", individual_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	@Override
	public int individualMultiDelete(String[] individual_nos) {
		int count = 0;
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("individual_nos", individual_nos);
		
		try(SqlSession session = getSqlSessionFactory().openSession(false);){
			count = session.delete(namespace+"individualMultiDelete", map);
			if(count == individual_nos.length) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}



	@Override
	public int individualCount(String individual_id, String yyyyMMdd) {
		
		SqlSession session = null;
		
		int count = 0;
		
		Map<String, String> map = new HashMap<>();
		
		map.put("individual_id", individual_id);
		map.put("yyyyMMdd", yyyyMMdd);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			count = session.selectOne("individualmapper.individualCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return count;
	}












}