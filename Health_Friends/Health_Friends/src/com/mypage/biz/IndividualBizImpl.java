package com.mypage.biz;

import java.util.List;

import com.mypage.dao.IndividualDao;
import com.mypage.dao.IndividualDaoImpl;
import com.mypage.dto.IndividualDto;

public class IndividualBizImpl implements IndividualBiz {
	
	IndividualDao dao = new IndividualDaoImpl();

	@Override
	public List<IndividualDto> individualList(String individual_id, String yyyyMMdd) {
		return dao.individualList(individual_id, yyyyMMdd);
	}

	@Override
	public int individualInsert(IndividualDto dto) {
		return dao.individualInsert(dto);
	}
	
	@Override
	public IndividualDto individualSelectOne(int individual_no) {
		return dao.individualSelectOne(individual_no);
	}
	
	@Override
	public int individualUpdate(IndividualDto dto) {
		return dao.individualUpdate(dto);
	}
	
	@Override
	public int individualDelete(int individual_no) {
		return dao.individualDelete(individual_no);
	}
	
	@Override
	public int individualMultiDelete(String[] individual_nos) {
		return dao.individualMultiDelete(individual_nos);
	}

	@Override
	public List<IndividualDto> individualViewList(String individual_id, String yyyyMM) {
		return null;
	}

	@Override
	public int individualViewCount(String individual_id, String yyyyMMdd) {
		// TODO Auto-generated method stub
		return 0;
	}





}
