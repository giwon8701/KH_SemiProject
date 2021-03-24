package com.shopping.dto;

public class SearchDto {

	private String title;
	private String image;
	private int lprice;
	private String brand;
	private String category3;
	
	public SearchDto() {
	}
	
	public SearchDto(String title, String image, int lprice, String brand, String category3) {
		this.title = title;
		this.image = image;
		this.lprice = lprice;
		this.brand = brand;
		this.category3 = category3;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}
	
	public int getLprice() {
		return lprice;
	}
	
	public void setLprice(int lprice) {
		this.lprice = lprice;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public String getCategory3() {
		return category3;
	}
	
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	
}
