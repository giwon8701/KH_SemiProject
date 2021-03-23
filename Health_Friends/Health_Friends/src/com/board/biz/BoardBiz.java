package com.board.biz;

import java.util.List;

import com.board.dto.BoardDto;

public interface BoardBiz {

	public List<BoardDto> selectList();
	public BoardDto selectOne(int postNo);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int postNo);
	public int multiDelete(String[] postNos);
	
}
