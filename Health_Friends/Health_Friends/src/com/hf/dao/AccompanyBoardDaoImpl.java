package com.hf.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hf.db.SqlMapConfig;
import com.hf.dto.AccompanyBoardDto;

public class AccompanyBoardDaoImpl extends SqlMapConfig implements AccompanyBoardDao {
	
	@Override
	public List<AccompanyBoardDto> selectList() {
		SqlSession session = null;
		
		List<AccompanyBoardDto> list = new ArrayList<AccompanyBoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("accompanyBoardMapper.selectList");
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public AccompanyBoardDto selectOne(int postNo) {
		return null;
	}

	@Override
	public int insert(AccompanyBoardDto dto) {
		return 0;
	}

	@Override
	public int update(AccompanyBoardDto dto) {
		return 0;
	}

	@Override
	public int delete(int postNo) {
		return 0;
	}

	@Override
	public int multiDelete(String[] postNos) {
		return 0;
	}

}
