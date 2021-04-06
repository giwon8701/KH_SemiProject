package com.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.board.dto.BoardDto;
import com.board.dto.ScrapDto;
import com.common.SqlMapConfig;

public class ScrapDaoImpl extends SqlMapConfig implements ScrapDao  {

	@Override
	public int addScrap(ScrapDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.insert("BoardMapper.addscrap", dto);
			if(res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delScrap(int scrap_user_no) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.insert("BoardMapper.delscrap", scrap_user_no);
			if(res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<BoardDto> listScrap(int scrap_user_no) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			list = session.selectList("BoardMapper.scrapList", scrap_user_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
