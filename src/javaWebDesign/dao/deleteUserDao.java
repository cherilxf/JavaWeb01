package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class deleteUserDao {
	
	public boolean deleteInfo(String username) throws Exception{
			
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "delete from userInfo where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1,username);
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		dbConn.close();
		pstmt.close();
		return false;
	}
}
