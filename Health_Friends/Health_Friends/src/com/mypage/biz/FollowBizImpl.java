package com.mypage.biz;

import java.util.List;
import java.util.Map;

import com.login.dto.RegistDto;
import com.mypage.dao.FollowDao;
import com.mypage.dao.FollowDaoImpl;
import com.mypage.dto.FollowDto;

public class FollowBizImpl implements FollowBiz {

	FollowDao dao = new FollowDaoImpl();
	
	@Override
	public List<RegistDto> searchFollwing(int member_no) {
		return dao.searchFollwing(member_no);
	}

	@Override
	public int addFollowing(int member_no) {
		return 0;
	}

	@Override
	public int removeFollowing(int member_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RegistDto> searchFollowed(int member_no) {
		return dao.searchFollowed(member_no);
	}

	@Override
	public int removeFollowed(int member_no) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
