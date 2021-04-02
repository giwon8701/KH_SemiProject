package com.board.biz;

import java.util.List;

import com.board.dto.BoardDto;

public interface BoardBiz {

	public List<BoardDto> accompany_selectList();
	public List<BoardDto> notice_selectList();
	public List<BoardDto> photo_selectList();
	public BoardDto accompany_selectOne(int postId);
	public BoardDto photo_selectOne(int postId);
	public BoardDto notice_selectOne(int postId);
	public int accompany_insert(BoardDto dto);
	public int notice_insert(BoardDto dto);
	public int accompany_update(BoardDto dto);
	public int photo_update(BoardDto dto);
	public int notice_update(BoardDto dto);
	public int delete(int postId);
	
}
