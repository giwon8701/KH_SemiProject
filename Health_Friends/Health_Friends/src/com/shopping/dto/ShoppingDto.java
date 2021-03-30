package com.shopping.dto;

public class ShoppingDto {

	private String title;
	private String link;
	private String image;
	private int lprice;
	private String brand;
	private String category3;
<<<<<<< Updated upstream:Health_Friends/Health_Friends/src/com/shopping/dto/ShoppingDto.java
	
	public ShoppingDto() {
		
	}
	
	public ShoppingDto(String title, String link, String image, int lprice, String brand, String category3) {
=======
	public SearchDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchDto(String title, String link, String image, int lprice, String brand, String category3) {
		super();
>>>>>>> Stashed changes:Health_Friends/Health_Friends/src/com/shopping/dto/SearchDto.java
		this.title = title;
		this.link = link;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
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

	