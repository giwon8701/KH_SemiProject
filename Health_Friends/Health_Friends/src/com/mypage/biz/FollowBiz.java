package com.mypage.biz;

import java.util.List;
import java.util.Map;

import com.login.dto.RegistDto;
import com.mypage.dto.FollowDto;

public interface FollowBiz {

	// 팔로잉 조회(파라미터: 본인번호)
		public List<RegistDto> searchFollwing(int member_no);
		
		// 팔로잉 추가(파라미터: 추가할 유저번호)
		public int addFollow(FollowDto dto);
		// 팔로잉 삭제(파라미터: 삭제할 유저번호)
		public int removeFollow(FollowDto dto);
		
		// 팔로워 조회(파라미터: 본인번호)
		public List<RegistDto> searchFollowed(int member_no);
		// 팔로워 삭제(파라미터: 삭제할 유저번호)
		public int removeFollowed(int member_no);
		
		public int followChk(FollowDto dto);
		
		public List<RegistDto> searchId(String searchId);
}
