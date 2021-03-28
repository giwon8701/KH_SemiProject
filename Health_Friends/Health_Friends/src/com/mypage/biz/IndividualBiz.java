package com.mypage.biz;

import java.util.List;

import com.mypage.dto.IndividualDto;

public interface IndividualBiz {
	
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd);
	public int individualInsert(IndividualDto dto);
	public IndividualDto individualSelectOne(int individual_no);
	public int individualUpdate(IndividualDto dto);
	public int individualDelete(int individual_seq);
	public int individualMultiDelete(String[] individual_nos);	
	public int individualCount(String individual_id, String yyyyMMdd);
}
