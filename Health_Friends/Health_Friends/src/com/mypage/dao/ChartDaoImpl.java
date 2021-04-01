package com.mypage.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;

public class ChartDaoImpl extends SqlMapConfig implements ChartDao {

	@Override
	public int todayChart(String individual_id, String yyyyMMdd) {
		int res = 0;
		
		
		SqlSession session = null;
		
		
		Map<String, String> map = new HashMap<>();
		
		map.put("individual_id", individual_id);
		map.put("yyyyMMdd", yyyyMMdd);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("individualmapper.individualCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		
		
		return res;
	}

}
