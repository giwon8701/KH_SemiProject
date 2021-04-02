package com.mypage.biz;

import com.mypage.dao.ChartDao;
import com.mypage.dao.ChartDaoImpl;

public class ChartBizImpl implements ChartBiz {

	ChartDao dao = new ChartDaoImpl();
	
	@Override
	public int todayChart(String individual_id, String yyyyMMdd) {
		return dao.todayChart(individual_id, yyyyMMdd);
	}

}
