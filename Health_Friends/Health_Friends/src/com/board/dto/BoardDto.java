package com.board.dto;

import java.util.Date;

public class BoardDto {
	private int postUserNo;
	private int postId;
	private int postNo;
	private String postBoardName;
	private int postCategoryName;
	private String postTitle;
	private String postContent;
	private Date postMdate;
	private Date postRegdate;
	private int postHit;
	private int postCommentHit;
	private int postLike;
	private int postDelfag;
	private int postLatitude;
	private int postLongitude;
	
	public BoardDto() {}
	
	public BoardDto(int postUserNo, int postId, int postNo, String postBoardName, int postCategoryName,
			String postTitle, String postContent, Date postMdate, Date postRegdate, int postHit, int postCommentHit,
			int postLike, int postDelfag, int postLatitude, int postLongitude) {
		super();
		this.postUserNo = postUserNo;
		this.postId = postId;
		this.postNo = postNo;
		this.postBoardName = postBoardName;
		this.postCategoryName = postCategoryName;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postMdate = postMdate;
		this.postRegdate = postRegdate;
		this.postHit = postHit;
		this.postCommentHit = postCommentHit;
		this.postLike = postLike;
		this.postDelfag = postDelfag;
		this.postLatitude = postLatitude;
		this.postLongitude = postLongitude;
	}

	public int getPostUserNo() {
		return postUserNo;
	}

	public void setPostUserNo(int postUserNo) {
		this.postUserNo = postUserNo;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostBoardName() {
		return postBoardName;
	}

	public void setPostBoardName(String postBoardName) {
		this.postBoardName = postBoardName;
	}

	public int getPostCategoryName() {
		return postCategoryName;
	}

	public void setPostCategoryName(int postCategoryName) {
		this.postCategoryName = postCategoryName;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public Date getPostMdate() {
		return postMdate;
	}

	public void setPostMdate(Date postMdate) {
		this.postMdate = postMdate;
	}

	public Date getPostRegdate() {
		return postRegdate;
	}

	public void setPostRegdate(Date postRegdate) {
		this.postRegdate = postRegdate;
	}

	public int getPostHit() {
		return postHit;
	}

	public void setPostHit(int postHit) {
		this.postHit = postHit;
	}

	public int getPostCommentHit() {
		return postCommentHit;
	}

	public void setPostCommentHit(int postCommentHit) {
		this.postCommentHit = postCommentHit;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public int getPostDelfag() {
		return postDelfag;
	}

	public void setPostDelfag(int postDelfag) {
		this.postDelfag = postDelfag;
	}

	public int getPostLatitude() {
		return postLatitude;
	}

	public void setPostLatitude(int postLatitude) {
		this.postLatitude = postLatitude;
	}

	public int getPostLongitude() {
		return postLongitude;
	}

	public void setPostLongitude(int postLongitude) {
		this.postLongitude = postLongitude;
	}
}
