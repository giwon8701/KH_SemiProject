package com.login.dao;

import java.util.List;

import com.board.dto.RegistDto;

public interface RegistDao {
	
	//중복체크
	public int registCheck(String member);
	
	//회원가입
	public int registMember(RegistDto dto);
	
	//로그인
	public List<RegistDto> login(RegistDto logindto);

}
