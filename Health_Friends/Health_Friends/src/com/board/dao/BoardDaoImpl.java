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
			dto = session.selectOne("BoardMapper.accompany_selectOne", postId);
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
			dto = session.selectOne("BoardMapper.notice_selectOne", postId);
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
			dto = session.selectOne("BoardMapper.notice_selectOne", postId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	}

	
	@Override
	public int accompany_insert(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.insert("BoardMapper.accompany_insert", dto);
			System.out.println(res);
		} catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int notice_insert(BoardDto dto) {
		
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
	public int accompany_update(BoardDto dto) {
		
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.update("BoardMapper.accompany_update", dto);
			System.out.println(res);
		} catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int photo_update(BoardDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.update("BoardMapper.photo_update", dto);
			System.out.println(res);
		} catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int notice_update(BoardDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.update("BoardMapper.notice_update", dto);
			System.out.println(res);
		} catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int delete(int postId) {
		return 0;
	}


}
