package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javaWebDesign.model.loginUser;

public class loginDao {
	public loginUser queryConsumer(String name) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "select * from userConsumer where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("username"));
			tmpUser.setPassWord(rs.getString("password"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public loginUser queryShop(String name) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "select * from userShop where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("username"));
			tmpUser.setPassWord(rs.getString("password"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public loginUser queryOperator(String name) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "select * from userOperator where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		loginUser tmpUser = new loginUser();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("username"));
			tmpUser.setPassWord(rs.getString("password"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
//	public static void main(String[] args) throws Exception {
//		LoginDao ld = new LoginDao();
//		User user = ld.queryUser("admin");
//		System.out.println(user);
//	}
}
