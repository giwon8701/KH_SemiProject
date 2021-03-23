package com.login.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.db.SqlMapConfig;
import com.board.dto.RegistDto;

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
	public List<RegistDto> login(RegistDto logindto) {
		
		List<RegistDto> list = null;
		int cnt = -1;
		
		
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			
			cnt = session.selectOne("registmapper.login", logindto);
			
			if(cnt > 0) {
				list = session.selectList("registmapper.memberList", logindto);
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

}
