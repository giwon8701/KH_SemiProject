package com.login.biz;

import java.util.List;

import com.login.dto.RegistDto;


public interface RegistBiz {
	
	//id 중복체크
	public int registCheck(String member);
	
	//회원가입
	public int registMember(RegistDto dto);
	
	public List<RegistDto> login(RegistDto logindto);

}
