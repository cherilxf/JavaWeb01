package javaWebDesign.model;

public class food {
	private String shopName;
	private String foodImg;
	private String foodName;
	private String foodUnitPrice;   // 单价
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	public String getFoodImg() {
		return foodImg;
	}
	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}
	
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	
	public String getFoodUnitPrice() {
		return foodUnitPrice;
	}
	public void setFoodUnitPrice(String foodUnitPrice) {
		this.foodUnitPrice = foodUnitPrice;
	}
}
