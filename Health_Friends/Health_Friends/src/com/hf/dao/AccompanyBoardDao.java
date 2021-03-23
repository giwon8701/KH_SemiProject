package com.hf.dao;

import java.util.List;

import com.hf.dto.AccompanyBoardDto;

public interface AccompanyBoardDao {

	public List<AccompanyBoardDto> selectList();
	public AccompanyBoardDto selectOne(int postNo);
	public int insert(AccompanyBoardDto dto);
	public int update(AccompanyBoardDto dto);
	public int delete(int postNo);
	public int multiDelete(String[] postNos);
	
}
