package com.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;

public class ProfileDaoImpl extends SqlMapConfig implements ProfileDao {

	@Override
	public int profileUpdate(RegistDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.update("profilemapper.profileUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return res;
	}

}
