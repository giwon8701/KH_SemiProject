package com.mypage.dao;

import java.util.List;

import com.mypage.dto.IndividualDto;

public interface IndividualDao {
								
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd);
	public IndividualDto individualSelectOne(int individual_no);
	public int individualInsert(IndividualDto dto);
	public int individualUpdate(IndividualDto dto);
	public int individualDelete(int individual_no);
	public int individualMultiDelete(String[] individual_nos);
	public int individualCount(String individual_id, String yyyyMMdd);

}
