package com.board.dto;

public class ScrapDto {

	private int scrap_user_no;
	private int scrap_no;
	private int scrap_post_id;
	
	public ScrapDto() {
		
	}

	public ScrapDto(int scrap_user_no, int scrap_no, int scrap_post_id) {
		this.scrap_user_no = scrap_user_no;
		this.scrap_no = scrap_no;
		this.scrap_post_id = scrap_post_id;
	}

	public int getScrap_user_no() {
		return scrap_user_no;
	}

	public void setScrap_user_no(int scrap_user_no) {
		this.scrap_user_no = scrap_user_no;
	}

	public int getScrap_no() {
		return scrap_no;
	}

	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}

	public int getScrap_post_id() {
		return scrap_post_id;
	}

	public void setScrap_post_id(int scrap_post_id) {
		this.scrap_post_id = scrap_post_id;
	}
	
	
}
