package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.common.SqlMapConfig;

public class BoardDaoImpl extends SqlMapConfig implements BoardDao {
	
	@Override
	public List<BoardDto> accompany_selectList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("BoardMapper.accompany_selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public List<BoardDto> notice_selectList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("BoardMapper.notice_selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	public List<BoardDto> photo_selectList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("BoardMapper.photo_selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public BoardDto accompany_selectOne(int postId) {
		
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("boardmapper.accompany_selectOne", postId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}
	
	@Override
	public BoardDto notice_selectOne(int postId) {
		
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("boardmapper.notice_selectOne", postId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	@Override
	public BoardDto photo_selectOne(int postId) {
		
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("boardmapper.notice_selectOne", postId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	
	@Override
	public int insert(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.insert("BoardMapper.notice_insert", dto);
			System.out.println(res);
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
