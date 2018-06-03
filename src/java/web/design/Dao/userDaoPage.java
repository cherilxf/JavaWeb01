package java.web.design.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.web.design.Model.user;

public class userDaoPage {
	
	public ArrayList<user> queryAllUser() throws Exception{
			
		ArrayList<user> list = new ArrayList<user>();
			
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "select * from userInfo";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			user tempUser = new user();
			tempUser.setUserName(rs.getString("username"));
			tempUser.setPassWord(rs.getString("password"));
			tempUser.setAge(rs.getString("age"));
			tempUser.setTel(rs.getString("tel"));
			tempUser.setWeChat(rs.getString("wechat"));
			list.add(tempUser);
		}
		rs.close();
		dbConn.close();
		return list;
	}
	
	public ArrayList<user> queryUserByPage(int page,int pageSize) throws Exception{
		ArrayList<user> list = new ArrayList<user>();
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=Test","sa","12345678");
		String sql = "select * from userInfo";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		int flag1 = 0;
		int flag2 = 0;
		int activepage = page*pageSize+1;
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			flag1++;
			if(flag1 >= activepage) {
				flag2++;
				if(flag2 <= pageSize) {
					user tempUser = new user();
					tempUser.setUserName(rs.getString("username"));
					tempUser.setPassWord(rs.getString("password"));
					tempUser.setAge(rs.getString("age"));
					tempUser.setTel(rs.getString("tel"));
					tempUser.setWeChat(rs.getString("wechat"));
					list.add(tempUser);
				}
			}
		}
		rs.close();
		dbConn.close();
		return list;
	}
	
//	public static void main(String[] args) throws Exception {
//		UserDaoPage ud = new UserDaoPage();
//		ArrayList<User> list = ud.queryUserByPage(1,3);
//		if( list != null) {
//			for(User tmpUser:list) {
//				System.out.println(tmpUser);
//			}
//		}
//		
//	}
}
