package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javaWebDesign.model.operatorInfo;

public class operatorDao {
	public operatorInfo queryOperatorInfo(String operatorID) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from operatorInfo where operatorID=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, operatorID);
		ResultSet rs = pstmt.executeQuery();
		operatorInfo tmpOperator = new operatorInfo();
		if(rs.next()) {
			tmpOperator.setOperatorID(rs.getString("operatorID"));
			tmpOperator.setName(rs.getString("operatorName"));
			tmpOperator.setAge(rs.getString("age"));
			tmpOperator.setSex(rs.getString("sex"));
			tmpOperator.setTel(rs.getString("tel"));
			tmpOperator.setWechat(rs.getString("wechat"));
		}else {
			tmpOperator = null;
		}
		rs.close();
		dbConn.close();
		return tmpOperator;
	}
	
//	public boolean setInfo(operatorInfo oInfo) throws Exception{
//		DataSource ds = new DataSource();
//		Connection dbConn = ds.getConnection();
//		String sql = "update operatorInfo set name=?,age=?,sex=?,tel=?,wechat=? where operatorID=?";
//		PreparedStatement pstmt = dbConn.prepareStatement(sql);
//		pstmt.setString(1, oInfo.getName());
//		pstmt.setString(2, oInfo.getAge());
//		pstmt.setString(3, oInfo.getSex());
//		pstmt.setString(4, oInfo.getTel());
//		pstmt.setString(5, oInfo.getWechat());
//		pstmt.setString(6, oInfo.getOperatorID());
//		int result = pstmt.executeUpdate();
//		if(result == 1){
//			return true;
//		}
//		pstmt.close();
//		dbConn.close();
//		return false;
//	}
}
