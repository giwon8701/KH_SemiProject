package com.board.dto;

public class ImageDto {

	private int image_file_no;
	private int image_post_no;
	private String image_path;
	
	public ImageDto() {
		
	}

	public ImageDto(int image_file_no, int image_post_no, String image_path) {
		this.image_file_no = image_file_no;
		this.image_post_no = image_post_no;
		this.image_path = image_path;
	}

	public int getImage_file_no() {
		return image_file_no;
	}

	public void setImage_file_no(int image_file_no) {
		this.image_file_no = image_file_no;
	}

	public int getImage_post_no() {
		return image_post_no;
	}

	public void setImage_post_no(int image_post_no) {
		this.image_post_no = image_post_no;
	}

	public String getImage_path() {
		return image_path;
	}

	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	
}
