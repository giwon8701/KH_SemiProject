package com.login.dao;

import java.util.List;
import java.util.Map;

import com.login.dto.RegistDto;


public interface RegistDao {
	
	//중복체크
	public int registCheck(String member);
	
	//회원가입
	public int registMember(RegistDto dto);
	
	//로그인
	public int login(RegistDto logindto);
	
	//회원정보
	public RegistDto selectOne(RegistDto logindto);
	

}
