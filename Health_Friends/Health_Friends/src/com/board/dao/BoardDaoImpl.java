package com.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.common.SqlMapConfig;
import com.mypage.dto.PaymentDto;

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
	public BoardDto selectOneByPostId(int postId) {
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("BoardMapper.selectOneByPostid", postId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dto;
	};
	
	@Override
	public BoardDto accompany_selectOne(int postId) {
		
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("BoardMapper.accompany_selectOne", postId);
		} catch (Exception e) {
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
			dto = session.selectOne("BoardMapper.photo_selectOne", postId);
			System.out.println(dto.getPostTitle());
		} catch (Exception e) {
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
			System.out.println("res: " +res);
		} catch(Exception e){
			e.printStackTrace();
		} 
		return res;
	}
	
	@Override
	public int photo_insert(BoardDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.insert("BoardMapper.photo_insert", dto);
			System.out.println(res);
			if(res > 0) {
				session.commit();
			}
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
			System.out.println(dto.getPostTitle());
			res = session.update("BoardMapper.notice_update", dto);
		} catch(Exception e){
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int accompany_delete(int postId) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.update("BoardMapper.accompany_delete", postId);
		}catch (Exception e){
			e.printStackTrace();
		} 
		return res;
	}

	@Override
	public int notice_delete(int postId) {
		int res = 0;
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.update("BoardMapper.notice_delete", postId);
			System.out.println(res);
		}catch (Exception e){
			e.printStackTrace();
		} 
		return res;
	}

	@Override
	public List<BoardDto> notice_selectListPaging(int startRow, int endRow) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		endRow += startRow;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println(map);
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList("BoardMapper.notice_selectListPaging", map);
			System.out.println("다오"+list);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public List<BoardDto> accompany_selectListPaging(int startRow, int endRow) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		endRow += startRow;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println(map);
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList("BoardMapper.accompany_selectListPaging", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public List<BoardDto> photo_selectListPaging(int startRow, int endRow) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		endRow += startRow;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println(map);
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList("BoardMapper.photo_selectListPaging", map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public int accompanyGetTotalCount() {
		SqlSession session = null;

		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("BoardMapper.accompanyGetTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return res;
	}

	@Override
	public int noticeGetTotalCount() {
		SqlSession session = null;

		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("BoardMapper.noticeGetTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return res;
	}

	@Override
	public int photoGetTotalCount() {
		SqlSession session = null;

		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("BoardMapper.photoGetTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	
		return res;
	}
}
