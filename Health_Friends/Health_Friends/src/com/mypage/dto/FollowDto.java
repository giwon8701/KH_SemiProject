package com.mypage.dto;

public class FollowDto {
	
	private int follow_no;
	private int follow_following_no; 
	private int follow_member_no;
	
	public FollowDto() {
		
	}

	public FollowDto(int follow_no, int follow_following_no, int follow_member_no) {
		this.follow_no = follow_no;
		this.follow_following_no = follow_following_no;
		this.follow_member_no = follow_member_no;
	}

	public int getFollow_no() {
		return follow_no;
	}

	public void setFollow_no(int follow_no) {
		this.follow_no = follow_no;
	}

	public int getFollow_following_no() {
		return follow_following_no;
	}

	public void setFollow_following_no(int follow_following_no) {
		this.follow_following_no = follow_following_no;
	}

	public int getFollow_member_no() {
		return follow_member_no;
	}

	public void setFollow_member_no(int follow_member_no) {
		this.follow_member_no = follow_member_no;
	}
	
}
