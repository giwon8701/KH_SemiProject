package com.mypage.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.common.SqlMapConfig;
import com.mypage.dto.FollowDto;

public class FollowDaoImpl  extends SqlMapConfig implements FollowDao {

	@Override
	public List<FollowDto> searchFollwing(int member_no) {
		List<FollowDto> list = new ArrayList<FollowDto>();
		
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
	public int addFollowing(int member_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeFollowing(int member_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FollowDto> searchFollowed(int member_no) {
		List<FollowDto> list = new ArrayList<FollowDto>();
		
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
