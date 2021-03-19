package com.hf.dto;

public class RegisterDto {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberBirthday;
	private String memberGender;
	private String memberEmail;
	private String memberPhone;
	private String memberEnabled;
	private int memberReview;
	private String memberRole;
	
	public RegisterDto() {
		
	}
	
	public RegisterDto(int memberNo, String memberId, String memberPw, String memberName, String memberBirthday,
			String memberGender, String memberEmail, String memberPhone, String memberEnabled, int memberReview,
			String memberRole) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberBirthday = memberBirthday;
		this.memberGender = memberGender;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberEnabled = memberEnabled;
		this.memberReview = memberReview;
		this.memberRole = memberRole;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirthday() {
		return memberBirthday;
	}

	public void setMemberBirthday(String memberBirthday) {
		this.memberBirthday = memberBirthday;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEnabled() {
		return memberEnabled;
	}

	public void setMemberEnabled(String memberEnabled) {
		this.memberEnabled = memberEnabled;
	}

	public int getMemberReview() {
		return memberReview;
	}

	public void setMemberReview(int memberReview) {
		this.memberReview = memberReview;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}
	

}
