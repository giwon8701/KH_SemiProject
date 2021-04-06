package com.mypage.dao;

import java.util.List;
import java.util.Map;

import com.login.dto.RegistDto;
import com.mypage.dto.FollowDto;

public interface FollowDao {
	// 팔로잉 조회(파라미터: 본인번호)
	public List<RegistDto> searchFollwing(int member_no);
	
	//팔로우 추가
	public int addFollow(FollowDto dto);
	//팔로우 삭제
	public int removeFollow(FollowDto dto);
	
	// 팔로워 조회(파라미터: 본인번호)
	public List<RegistDto> searchFollowed(int member_no);
	// 팔로워 차단(파라미터: 삭제할 유저번호)
	public int removeFollowed(int member_no);

	//팔로우 유무 체크
	public int followChk(FollowDto dto);
	
	public List<String> searchId(String searchId);
}
