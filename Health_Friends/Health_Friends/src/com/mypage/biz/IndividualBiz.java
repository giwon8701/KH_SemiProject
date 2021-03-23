package com.mypage.biz;

import java.util.List;

import com.board.dto.IndividualDto;

public interface IndividualBiz {
	
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd);
	public int individualInsert(IndividualDto dto);
	public List<IndividualDto> individualViewList(String individual_id, String yyyyMM);
	public int individualViewCount(String individual_id, String yyyyMMdd);
	public IndividualDto individualSelectOne(int individual_no);
	public int individualUpdate(IndividualDto dto);
	public int individualDelete(int individual_seq);
	
}
