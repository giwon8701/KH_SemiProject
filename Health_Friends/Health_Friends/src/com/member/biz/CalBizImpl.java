package com.member.biz;

import java.util.List;

import com.member.dao.CalDao;
import com.member.dao.CalDaoImpl;
import com.member.dto.CalDto;

public class CalBizImpl implements CalBiz {
	
	CalDao dao = new CalDaoImpl();

	@Override
	public int insertCalBoard(CalDto dto) {
		return dao.insertCalBoard(dto);
	}
	
	@Override
	public List<CalDto> getCalViewList(String id, String yyyyMM) {
		return dao.getCalViewList(id, yyyyMM);
	}

	@Override
	public List<CalDto> getCalList(String id, String yyyyMM) {
		return dao.getCalViewList(id, yyyyMM);
	}

	@Override
	public int getCalViewCount(String id, String yyyyMMdd) {
		return dao.getCalViewCount(id, yyyyMMdd);
	}

	@Override
	public CalDto selectOneCalBoard(int seq) {
		return dao.selectOneCalBoard(seq);
	}

	@Override
	public int updateCalBoard(CalDto dto) {
		return dao.updateCalBoard(dto);
	}

	@Override
	public int deleteCalBoard(int seq) {
		return dao.deleteCalBoard(seq);
	}

}
