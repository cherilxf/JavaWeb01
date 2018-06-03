package java.web.design.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.web.design.Model.user;

public class registerDao {
		
	public user queryUser(String name) throws Exception{
		
		user tmpUser = new user();
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "select * from userInfo where username=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			tmpUser.setUserName(rs.getString("username"));
			tmpUser.setPassWord(rs.getString("password"));
		}else {
			tmpUser = null;
		}
		pstmt.close();
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public boolean saveUserinfo(user user) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "insert into userInfo values (?,?,null,null,null)";
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
	
//	public static void main(String[] args) throws Exception {
//		RegisterDao rd = new RegisterDao();
//		User user = rd.queryUser("admin");
//		if( user != null) {
//			System.out.println(user);
//		}
//		
//	}
}
