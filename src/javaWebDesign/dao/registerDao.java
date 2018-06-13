package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javaWebDesign.model.loginUser;

public class registerDao {
	
	public boolean addConsumer(loginUser user) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "insert into userConsumer values (?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
	
	public boolean addShop(loginUser user) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "insert into userShop values (?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
	
	public boolean addOperator(loginUser user) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "insert into userOperator values (?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
}
