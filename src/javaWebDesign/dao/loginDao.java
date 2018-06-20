package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javaWebDesign.model.loginUser;

public class loginDao {
	public loginUser queryConsumer(String name) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from consumerInfo where consumerID=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("consumerID"));
			tmpUser.setPassWord(rs.getString("passWord"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public loginUser queryShop(String name) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from shopManage where userName=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("userName"));
			tmpUser.setPassWord(rs.getString("passWord"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public loginUser queryOperator(String name) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from operatorManage where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("userName"));
			tmpUser.setPassWord(rs.getString("passWord"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
}
