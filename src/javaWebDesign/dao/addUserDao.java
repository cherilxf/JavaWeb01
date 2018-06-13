package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javaWebDesign.model.user;

public class addUserDao {
	public boolean saveUserinfo(user user) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "insert into userInfo values (?,?,?,?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, user.getUserName());
		pstmt.setString(2, user.getPassWord());
		pstmt.setString(3, user.getAge());
		pstmt.setString(4, user.getTel());
		pstmt.setString(5, user.getWeChat());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
}
