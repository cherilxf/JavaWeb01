package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javaWebDesign.model.food;
import javaWebDesign.model.shop;

public class foodDao {
	
	public ArrayList<shop> queryTjsj() throws Exception{
		
		ArrayList<shop> list = new ArrayList<shop>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from tjsj";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			shop tempShop = new shop();
			tempShop.setShopImg(rs.getString("shopImg"));
			tempShop.setShopName(rs.getString("shopName"));
			tempShop.setPingfen(rs.getString("pingfen"));
			tempShop.setSale(rs.getString("sale"));
			tempShop.setYouhui(rs.getString("youhui"));
			list.add(tempShop);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<food> queryJrcptj() throws Exception{
			
		ArrayList<food> list = new ArrayList<food>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from jrcptj";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			food tempFood = new food();
			tempFood.setFoodName(rs.getString("foodImg"));
			tempFood.setFoodName(rs.getString("foodName"));
			tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
			list.add(tempFood);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<shop> queryDpdp() throws Exception{
		
		ArrayList<shop> list = new ArrayList<shop>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from dpdp";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			shop tempShop = new shop();
			tempShop.setShopImg(rs.getString("shopImg"));
			tempShop.setShopName(rs.getString("shopName"));
			tempShop.setPingfen(rs.getString("pingfen"));
			tempShop.setSale(rs.getString("sale"));
			tempShop.setYouhui(rs.getString("youhui"));
			list.add(tempShop);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<shop> queryXyyx() throws Exception{
		
		ArrayList<shop> list = new ArrayList<shop>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from xyyx";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			shop tempShop = new shop();
			tempShop.setShopImg(rs.getString("shopImg"));
			tempShop.setShopName(rs.getString("shopName"));
			tempShop.setPingfen(rs.getString("pingfen"));
			tempShop.setSale(rs.getString("sale"));
			tempShop.setYouhui(rs.getString("youhui"));
			list.add(tempShop);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<food> queryXsrm() throws Exception{
		
		ArrayList<food> list = new ArrayList<food>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from xsrm";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			food tempFood = new food();
			tempFood.setFoodName(rs.getString("foodImg"));
			tempFood.setFoodName(rs.getString("foodName"));
			tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
			list.add(tempFood);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<food> queryMsmk() throws Exception{
		
		ArrayList<food> list = new ArrayList<food>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from msmk";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			food tempFood = new food();
			tempFood.setFoodName(rs.getString("foodImg"));
			tempFood.setFoodName(rs.getString("foodName"));
			tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
			list.add(tempFood);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public ArrayList<food> queryZjhb() throws Exception{
			
		ArrayList<food> list = new ArrayList<food>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from zjhb";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			food tempFood = new food();
			tempFood.setFoodName(rs.getString("foodImg"));
			tempFood.setFoodName(rs.getString("foodName"));
			tempFood.setFoodUnitPrice(rs.getString("foodUnitPrice"));
			list.add(tempFood);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
}
