package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javaWebDesign.model.operatorInfo;

public class operatorDao {
	public operatorInfo queryOperatorInfo(String account) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "select * from operatorInfo where account=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, account);
		ResultSet rs = pstmt.executeQuery();
		operatorInfo tmpUser = new operatorInfo();
		if(rs.next()) {
			tmpUser.setName(rs.getString("name"));
			tmpUser.setAccount(rs.getString("account"));
			tmpUser.setAge(rs.getString("age"));
			tmpUser.setSex(rs.getString("sex"));
			tmpUser.setTel(rs.getString("tel"));
			tmpUser.setWechat(rs.getString("wechat"));
			tmpUser.setQq(rs.getString("qq"));
			tmpUser.setCity(rs.getString("city"));
			tmpUser.setJob(rs.getString("job"));
			tmpUser.setHobby(rs.getString("hobby"));
		}else {
			tmpUser = null;
		}
		rs.close();
		dbConn.close();
		return tmpUser;
	}
	
	public boolean setInfo(operatorInfo oInfo) throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection dbConn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=JavaWebDesign","sa","12345678");
		String sql = "update operatorInfo set name=?,age=?,sex=?,tel=?,wechat=?,qq=?,city=?,job=?,hobby=? where account=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, oInfo.getName());
		pstmt.setString(2, oInfo.getAge());
		pstmt.setString(3, oInfo.getSex());
		pstmt.setString(4, oInfo.getTel());
		pstmt.setString(5, oInfo.getWechat());
		pstmt.setString(6, oInfo.getQq());
		pstmt.setString(7, oInfo.getCity());
		pstmt.setString(8, oInfo.getJob());
		pstmt.setString(9, oInfo.getHobby());
		pstmt.setString(10, oInfo.getAccount());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
}
