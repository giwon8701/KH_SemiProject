package com.board.biz;

import java.util.List;

import com.board.dao.ScrapDao;
import com.board.dao.ScrapDaoImpl;
import com.board.dto.BoardDto;
import com.board.dto.ScrapDto;

public class ScrapBizImpl implements ScrapBiz {

	ScrapDao dao = new ScrapDaoImpl();
	
	@Override
	public int addScrap(ScrapDto dto) {
		return dao.addScrap(dto);
	}

	@Override
	public int delScrap(int scrap_user_no) {
		return dao.delScrap(scrap_user_no);
	}

	@Override
	public List<BoardDto> listScrap(int scrap_user_no) {
		return dao.listScrap(scrap_user_no);
	}

}
