package com.mypage.dao;

import java.util.List;

import com.mypage.dto.FollowDto;

public interface FollowDao {
	// 팔로잉 조회(파라미터: 본인번호)
	public List<FollowDto> searchFollwing(int member_no);
	// 팔로잉 추가(파라미터: 추가할 유저번호)
	public int addFollowing(int member_no);
	// 팔로잉 삭제(파라미터: 삭제할 유저번호)
	public int removeFollowing(int member_no);
	
	// 팔로워 조회(파라미터: 본인번호)
	public List<FollowDto> searchFollowed(int member_no);
	// 팔로워 삭제(파라미터: 삭제할 유저번호)
	public int removeFollowed(int member_no);

}
