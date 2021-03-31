package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.common.SqlMapConfig;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {
	
	@Override
	public List<BoardDto> selectList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("BoardMapper.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public BoardDto selectOne(int postId) {
		return null;
	}

	@Override
	public int insert(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.insert("BoardMapper.insert", dto);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		return 0;
	}

	@Override
	public int delete(int postId) {
		return 0;
	}

	@Override
	public int multiDelete(String[] postIds) {
		return 0;
	}

}
