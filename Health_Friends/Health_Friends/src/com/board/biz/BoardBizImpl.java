package com.board.biz;

import java.util.List;

import com.board.dao.BoardDao;
import com.board.dao.BoardDaoImpl;
import com.board.dto.BoardDto;

public class BoardBizImpl implements BoardBiz {
	
	BoardDao dao = new BoardDaoImpl();

	@Override
	public List<BoardDto> accompany_selectList() {
		return dao.accompany_selectList();
	}
	
	@Override
	public List<BoardDto> notice_selectList() {
		return dao.notice_selectList();
	}
	
	@Override
	public List<BoardDto> photo_selectList() {
		return dao.photo_selectList();
	}

	@Override
	public BoardDto accompany_selectOne(int postId) {
		return dao.accompany_selectOne(postId);
	}
	
	@Override
	public BoardDto notice_selectOne(int postId) {
		return dao.notice_selectOne(postId);
	}
	
	@Override
	public BoardDto photo_selectOne(int postId) {
		return dao.photo_selectOne(postId);
	}

	@Override
	public int accompany_insert(BoardDto dto) {
		return dao.accompany_insert(dto);
	}
	
	@Override
	public int photo_insert(BoardDto dto) {
		return dao.photo_insert(dto);
	}
	
	@Override
	public int notice_insert(BoardDto dto) {
		// TODO Auto-generated method stub
		return dao.notice_insert(dto);
	}

	@Override
	public int accompany_update(BoardDto dto) {
		return dao.accompany_update(dto);
	}

	@Override
	public int photo_update(BoardDto dto) {
		return dao.photo_update(dto);
	}

	@Override
	public int notice_update(BoardDto dto) {
		return dao.notice_update(dto);
	}

	@Override
	public int accompany_delete(int postId) {
		return dao.accompany_delete(postId);
	}
	
	@Override
	public int notice_delete(int postId) {
		return dao.notice_delete(postId);
	}




}
