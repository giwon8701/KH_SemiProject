package com.hf.biz;

import java.util.List;

import com.hf.dao.RegistDao;
import com.hf.dao.RegistDaoImpl;
import com.hf.dto.RegistDto;

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
	public List<RegistDto> login(RegistDto logindto) {
		return dao.login(logindto);
	};

}
