package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.common.SqlMapConfig;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {
	
	@Override
	public List<BoardDto> selectList() {
		SqlSession session = null;
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("BoardMapper.selectList");
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public BoardDto selectOne(int postNo) {
		return null;
	}

	@Override
	public int insert(BoardDto dto) {
		return 0;
	}

	@Override
	public int update(BoardDto dto) {
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
