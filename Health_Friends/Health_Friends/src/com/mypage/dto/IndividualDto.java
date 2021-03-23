package com.mypage.dto;

import java.util.Date;

public class IndividualDto {
	
	private int individual_no;
	private int profile_no;
	private String individual_id;
	private String individual_title;
	private String individual_content;
	private String individual_mdate;
	private Date individual_regdate;
	public int getIndividual_no() {
		return individual_no;
	}
	public void setIndividual_no(int individual_no) {
		this.individual_no = individual_no;
	}
	public int getProfile_no() {
		return profile_no;
	}
	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}
	public String getIndividual_id() {
		return individual_id;
	}
	public void setIndividual_id(String individual_id) {
		this.individual_id = individual_id;
	}
	public String getIndividual_title() {
		return individual_title;
	}
	public void setIndividual_title(String individual_title) {
		this.individual_title = individual_title;
	}
	public String getIndividual_content() {
		return individual_content;
	}
	public void setIndividual_content(String individual_content) {
		this.individual_content = individual_content;
	}
	public String getIndividual_mdate() {
		return individual_mdate;
	}
	public void setIndividual_mdate(String individual_mdate) {
		this.individual_mdate = individual_mdate;
	}
	public Date getIndividual_regdate() {
		return individual_regdate;
	}
	public void setIndividual_regdate(Date individual_regdate) {
		this.individual_regdate = individual_regdate;
	}
	public IndividualDto(int individual_no, int profile_no, String individual_id, String individual_title,
			String individual_content, String individual_mdate, Date individual_regdate) {
		super();
		this.individual_no = individual_no;
		this.profile_no = profile_no;
		this.individual_id = individual_id;
		this.individual_title = individual_title;
		this.individual_content = individual_content;
		this.individual_mdate = individual_mdate;
		this.individual_regdate = individual_regdate;
	}
	public IndividualDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
