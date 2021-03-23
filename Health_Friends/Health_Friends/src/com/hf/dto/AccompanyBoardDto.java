package com.hf.dto;

public class AccompanyBoardDto {
	
	private int postId;
	private String postTitle;
	
	public AccompanyBoardDto() {
	}

	public AccompanyBoardDto(int postId, String postTitle) {
		this.postId = postId;
		this.postTitle = postTitle;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	
}
