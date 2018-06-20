package javaWebDesign.service;

import java.util.ArrayList;

import javaWebDesign.dao.shopDao;
import javaWebDesign.model.food;
import javaWebDesign.model.shop;

public class shopService {
	shopDao sd = new shopDao();
	
	public shop getShop(String shopID) throws Exception{
		shop shop = new shop();
		shop = sd.queryShop(shopID);
		return shop;
	}
	
	public ArrayList<food> getFoodInfo(String shopName) throws Exception{
		ArrayList<food> list = new ArrayList<food>();
		list = sd.queryAllFood(shopName);
		return list;
	}
	
	public ArrayList<food> getFoodByPage(int page,int pageSize,String shopName) throws Exception{
		ArrayList<food> list = new ArrayList<food>();
		list = sd.queryFoodByPage(page, pageSize,shopName);
		return list;
	}
}
