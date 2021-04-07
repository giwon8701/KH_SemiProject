package com.login.biz;

import java.util.List;
import java.util.Map;

import com.login.dto.RegistDto;


public interface RegistBiz {
	
	public RegistDto selectByNo(int member_no);
	
	//id 중복체크
	public int registCheck(String member, String check);
	
	//회원가입
	public int registMember(RegistDto dto);
	
	public int login(RegistDto logindto);
	
	public RegistDto selectOne(RegistDto logindto);
	
	public RegistDto selectByEmail(String email);
	
	public RegistDto selectById(String id);
	
	public RegistDto idSearch(RegistDto dto);
	
	public int pwSearch(RegistDto dto);
	
	public int pwReset(RegistDto dto);
	
	public int updateRegist(RegistDto dto);
	
	public int deleteRegist(String member_id);

}
