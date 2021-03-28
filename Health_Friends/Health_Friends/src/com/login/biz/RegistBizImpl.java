package com.login.biz;

import java.util.List;
import java.util.Map;

import com.login.dao.RegistDao;
import com.login.dao.RegistDaoImpl;
import com.login.dto.RegistDto;


public class RegistBizImpl implements RegistBiz {
	
	RegistDao dao = new RegistDaoImpl();

	@Override
	public int registCheck(String member) {
		return dao.registCheck(member);
	}
	
	@Override
	public int registMember(RegistDto dto) {
		return dao.registMember(dto);
	}
	
	@Override
	public int login(RegistDto logindto) {
		return dao.login(logindto);
	};
	
	@Override
	public RegistDto selectOne(RegistDto logindto) {
		return dao.selectOne(logindto);
	}

	@Override
	public RegistDto selectByEmail(String email) {
		return dao.selectByEmail(email);
	};
}
