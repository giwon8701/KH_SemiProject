package com.hf.biz;

import java.util.List;

import com.hf.dto.CalDto;

public interface CalBiz {
	
	int insertCalBoard(CalDto dto);
	public List<CalDto> getCalList(String id, String yyyyMMdd);
	public List<CalDto> getCalViewList(String id, String yyyyMM);
	public int getCalViewCount(String id, String yyyyMMdd);
	public CalDto selectOneCalBoard(int seq);
	public int updateCalBoard(CalDto dto);
	public int deleteCalBoard(int seq);
	
}
