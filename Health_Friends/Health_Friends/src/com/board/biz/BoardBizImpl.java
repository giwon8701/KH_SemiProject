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
		return dao.notice_selectList();
	}

	@Override
	public BoardDto selectOne(int postId) {
		return dao.selectOne(postId);
	}

	@Override
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int postId) {
		return dao.delete(postId);
	}

	@Override
	public int multiDelete(String[] postIds) {
		return dao.multiDelete(postIds);
	}
}
