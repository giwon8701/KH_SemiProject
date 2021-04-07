package com.login.dao;

import com.login.dto.RegistDto;


public interface RegistDao {
	//회원고유번호로 정보 가져오기
	public RegistDto selectByNo(int member_no);
	
	//중복체크
	public int registCheck(String member, String check);
	
	//회원가입
	public int registMember(RegistDto dto);
	
	//로그인
	public int login(RegistDto logindto);
	
	//회원정보
	public RegistDto selectOne(RegistDto logindto);
	
	//이메일로 회원정보 가져오기
	public RegistDto selectByEmail(String email);
	
	//아이디로 회원정보 가져오기
	public RegistDto selectById(String id);
	
	//이름, 이메일로 아이디 찾기
	public RegistDto idSearch(RegistDto dto);
	
	//이름, 아이디, 이메일로 회원확인
	public int pwSearch(RegistDto dto);
	
	//비밀번호 재설정
	public int pwReset(RegistDto dto);
	
	//회원정보 수정
	public int updateRegist(RegistDto dto);
	
	//회원 탈퇴
	public int deleteRegist(String member_id);

}
