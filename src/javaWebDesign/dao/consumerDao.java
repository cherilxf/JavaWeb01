package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javaWebDesign.model.consumer;

public class consumerDao {
	public consumer queryConsumer(String consumerID) throws Exception{
		consumer tempConsumer = new consumer();
		
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from consumerInfo where consumerID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, consumerID);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			tempConsumer.setConsumerID(rs.getString("consumerID"));
			tempConsumer.setConsumerName(rs.getString("consumerName"));
			tempConsumer.setNichen(rs.getString("nichen"));
			tempConsumer.setAge(rs.getString("age"));
			tempConsumer.setTel(rs.getString("tel"));
			tempConsumer.setWechat(rs.getString("wechat"));
		}
		rs.close();
		ds.close(dbConn);
		return tempConsumer;
	}
	
	public boolean setConsumerInfo(consumer con) throws Exception{
		
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "update consumerInfo set consumerName=?,nichen=?,age=?,tel=?,wechat=? where consumerID=?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, con.getConsumerName());
		pstmt.setString(2, con.getNichen());
		pstmt.setString(3, con.getAge());
		pstmt.setString(4, con.getTel());
		pstmt.setString(5, con.getWechat());
		pstmt.setString(6, con.getConsumerID());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		ds.close(dbConn);
		return false;
	}
}
