package javaWebDesign.service;

import java.util.ArrayList;

import javaWebDesign.dao.foodDao;
import javaWebDesign.model.food;
import javaWebDesign.model.shop;

public class foodService {
	foodDao fd = new foodDao();
	
	public ArrayList<food> getAllFood(String sort) throws Exception{
		ArrayList<food> list = new ArrayList<food>();
		if(sort.equals("jrcptj")) {
			list = fd.queryJrcptj();
		}else if(sort.equals("xsrm")) {
			list = fd.queryXsrm();
		}else if(sort.equals("msmk")) {
			list = fd.queryMsmk();
		}else if(sort.equals("zjhb")) {
			list = fd.queryZjhb();
		}
		return list;
	}
	
	public ArrayList<shop> getAllShop(String sort) throws Exception{
		ArrayList<shop> list = new ArrayList<shop>();
		if(sort.equals("tjsj")) {
			list = fd.queryTjsj();
		}else if(sort.equals("dpdp")) {
			list = fd.queryDpdp();
		}else if(sort.equals("xyyx")) {
			list = fd.queryXyyx();
		}
		return list;
	}
	
	public ArrayList<food> getShopFood(String shopName) throws Exception{
		ArrayList<food> list = new ArrayList<food>();
		list = fd.queryShopFood(shopName);
		return list;
	}
}
