package com.hf.dao;

import java.util.List;

import com.hf.dto.IndividualDto;

public interface IndividualDao {
								
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd);
	public IndividualDto individualSelectOne(int individual_no);
	public int individualInsert(IndividualDto dto);
	public int individualUpdate(IndividualDto dto);
	public int individualDelete(int individual_no);
	public List<IndividualDto> individualViewList(String individual_id, String yyyyMM);
	public int individualViewCount(String individual_id, String yyyyMMdd);

}
