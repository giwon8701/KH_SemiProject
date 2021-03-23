package com.hf.biz;

import java.util.List;

import com.hf.dao.AccompanyBoardDao;
import com.hf.dao.AccompanyBoardDaoImpl;
import com.hf.dto.AccompanyBoardDto;

public class AccompanyBoardBizImpl implements AccompanyBoardBiz {
	
	AccompanyBoardDao dao = new AccompanyBoardDaoImpl();

	@Override
	public List<AccompanyBoardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public AccompanyBoardDto selectOne(int postNo) {
		return dao.selectOne(postNo);
	}

	@Override
	public int insert(AccompanyBoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(AccompanyBoardDto dto) {
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
