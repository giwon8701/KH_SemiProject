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
	
	@Override
	public RegistDto selectById(String id) {
		return dao.selectById(id);
	};
	
	@Override
	public RegistDto idSearch(RegistDto dto) {
		return dao.idSearch(dto);
	}
	
	@Override
	public int pwSearch(RegistDto dto) {
		return dao.pwSearch(dto);
	}
	
	@Override
	public int pwReset(RegistDto dto) {
		return dao.pwReset(dto);
	}
	
	@Override
	public int updateRegist(RegistDto dto) {
		return dao.updateRegist(dto);
	}
	
	@Override
	public int deleteRegist(String member_id) {
		return dao.deleteRegist(member_id);
	}
}
