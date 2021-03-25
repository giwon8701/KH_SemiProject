package com.login.dao;



import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;


public class RegistDaoImpl extends SqlMapConfig implements RegistDao {

	@Override
	public int registCheck(String member) {
		int cnt = -1;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			cnt = session.selectOne("registmapper.registCheck", member);
			System.out.println(member);
			
			if(cnt > 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	@Override
	public int registMember(RegistDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false);) {
			res = session.insert("registmapper.regist", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int login(RegistDto logindto) {
		
		int cnt = -1;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			
			cnt = session.selectOne("registmapper.login", logindto);
			System.out.println(logindto.getMember_id());
			if(cnt > 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	@Override
	public RegistDto selectOne(RegistDto logindto) {
		
		RegistDto dto = new RegistDto();
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			dto = session.selectOne("registmapper.selectOne", logindto);
		}
		
		return dto;
	};

}
