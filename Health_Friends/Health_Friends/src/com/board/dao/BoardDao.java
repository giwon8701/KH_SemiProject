package com.board.dao;

import java.util.List;

import com.board.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> accompany_selectList();
	public List<BoardDto> notice_selectList();
	public List<BoardDto> photo_selectList();
	public BoardDto selectOne(int postId);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int postId);
	public int multiDelete(String[] postIds);
	
}
