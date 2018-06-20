package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javaWebDesign.model.food;
import javaWebDesign.model.shop;

public class shopDao {
	public shop queryShop(String shopID) throws Exception{
		shop tempShop = new shop();
		
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from shopInfo where shopID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, shopID);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			tempShop.setShopID(rs.getString("shopID"));
			tempShop.setShopName(rs.getString("shopName"));
			tempShop.setShopAddress(rs.getString("shopAddress"));
			tempShop.setPeisongFee(rs.getString("peisongFee"));
			tempShop.setCanheFee(rs.getString("canheFee"));
			tempShop.setPingfen(rs.getString("pingfen"));
			tempShop.setSale(rs.getString("sale"));
			tempShop.setYouhui(rs.getString("youhui"));
		}
		rs.close();
		ds.close(dbConn);
		return tempShop;
	}
	
	public ArrayList<food> queryAllFood(String shopName) throws Exception{
		
		ArrayList<food> list = new ArrayList<food>();
		
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from foodInfo where shopName = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, shopName);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			food tempFood = new food();
			tempFood.setFoodImg(rs.getString("foodImg"));
			tempFood.setFoodName(rs.getString("foodName"));
			tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
			list.add(tempFood);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<food> queryFoodByPage(int page,int pageSize,String shopName) throws Exception{
		ArrayList<food> list = new ArrayList<food>();
		
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from foodInfo where shopName = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, shopName);
		int flag1 = 0;
		int flag2 = 0;
		int activepage = page*pageSize+1;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			flag1++;
			if(flag1 >= activepage) {
				flag2++;
				if(flag2 <= pageSize) {
					food tempFood = new food();
					tempFood.setFoodImg(rs.getString("foodImg"));
					tempFood.setFoodName(rs.getString("foodName"));
					tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
					list.add(tempFood);
				}
			}
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
}
