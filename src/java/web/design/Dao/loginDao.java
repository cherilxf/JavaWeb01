package java.web.design.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.web.design.Model.user;

public class loginDao {
	public user queryUser(String name) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "select * from userInfo where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		user tmpUser = new user();
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
