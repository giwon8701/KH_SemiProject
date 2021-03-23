package com.login.biz;

import java.util.List;

import com.board.dao.RegistDao;
import com.board.dao.RegistDaoImpl;
import com.board.dto.RegistDto;

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
