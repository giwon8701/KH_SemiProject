package com.board.biz;

import java.util.List;

import com.board.dto.BoardDto;

public interface BoardBiz {

	public List<BoardDto> selectList();
	public BoardDto selectOne(int postId);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int postId);
	public int multiDelete(String[] postIds);
	
}
