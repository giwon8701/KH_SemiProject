package com.board.dao;

import java.util.List;

import com.board.dto.BoardDto;
import com.board.dto.ScrapDto;

public interface ScrapDao {
	
	//찜하기
	public int addScrap(ScrapDto dto);
	
	//찜하기 해제
	public int delScrap(int scrap_user_no);
	
	//찜목록 조회
	public List<BoardDto> listScrap(int scrap_user_no);
	
}
