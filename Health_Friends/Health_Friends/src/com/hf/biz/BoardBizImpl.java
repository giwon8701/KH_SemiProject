package com.hf.biz;

import java.util.List;

import com.hf.dao.BoardDao;
import com.hf.dao.BoardDaoImpl;
import com.hf.dto.BoardDto;

public class BoardBizImpl implements BoardBiz {
	
	BoardDao dao = new BoardDaoImpl();

	@Override
	public List<BoardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public BoardDto selectOne(int postNo) {
		return dao.selectOne(postNo);
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
	public int delete(int postNo) {
		return dao.delete(postNo);
	}

	@Override
	public int multiDelete(String[] postNos) {
		return dao.multiDelete(postNos);
	}

}
