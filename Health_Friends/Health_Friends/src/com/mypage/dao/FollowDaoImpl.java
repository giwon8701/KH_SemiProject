package com.mypage.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.login.dto.RegistDto;
import com.mypage.dto.FollowDto;

public class FollowDaoImpl  extends SqlMapConfig implements FollowDao {
	
	@Override
	public int followChk(FollowDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(true)){
			res = session.selectOne("profilemapper.followchk", dto);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public List<RegistDto> searchFollwing(int member_no) {
		List<RegistDto> list = new ArrayList<RegistDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("profilemapper.imfollowing", member_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int addFollow(FollowDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.insert("profilemapper.addfollow", dto);
			if(res > 0) {
				session.commit();
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int removeFollow(FollowDto dto) {
		int res = 0;
		
		try(SqlSession session = getSqlSessionFactory().openSession(false)){
			res = session.delete("profilemapper.removefollow", dto);
			if(res > 0) {
				session.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<RegistDto> searchFollowed(int member_no) {
		List<RegistDto> list = new ArrayList<RegistDto>();
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			list = session.selectList("profilemapper.followerofme", member_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int removeFollowed(int member_no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
