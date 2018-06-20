package javaWebDesign.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javaWebDesign.model.order;

public class orderDao {
	
	// 查找简单信息
	public ArrayList<order> queryOrder(String consumerName) throws Exception{
		
		ArrayList<order> list = new ArrayList<order>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from orderInfo where consumerName = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, consumerName);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			order tempOrder = new order();
			tempOrder.setOrderID(rs.getString("orderID"));
			tempOrder.setShopName(rs.getString("shopName"));
			tempOrder.setConsumerName(rs.getString("consumerName"));
			tempOrder.setOrderState(rs.getString("orderState"));
			tempOrder.setOrderTel(rs.getString("orderTel"));
			tempOrder.setOrderAddress(rs.getString("orderAddress"));
			tempOrder.setOrderTime(rs.getString("orderTime"));
			tempOrder.setOrderPayStyle(rs.getString("orderPayStyle"));
			tempOrder.setOrderPaySumPrice(rs.getString("orderPaySumPrice"));
			tempOrder.setOrderYouhui(rs.getString("orderYouhui"));
			tempOrder.setOrderShiFu(rs.getString("orderShiFu"));
			list.add(tempOrder);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	// 查找详细信息
	public order queryOrderInfo(String orderID) throws Exception{
		
		order tempOrder = new order();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from orderInfo where orderID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, orderID);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			tempOrder.setOrderID(rs.getString("orderID"));
			tempOrder.setShopName(rs.getString("shopName"));
			tempOrder.setConsumerName(rs.getString("consumerName"));
			tempOrder.setOrderState(rs.getString("orderState"));
			tempOrder.setOrderTel(rs.getString("orderTel"));
			tempOrder.setOrderAddress(rs.getString("orderAddress"));
			tempOrder.setOrderTime(rs.getString("orderTime"));
			tempOrder.setOrderPayStyle(rs.getString("orderPayStyle"));
			tempOrder.setOrderPaySumPrice(rs.getString("orderPaySumPrice"));
			tempOrder.setOrderYouhui(rs.getString("orderYouhui"));
			tempOrder.setOrderShiFu(rs.getString("orderShiFu"));
		}
		rs.close();
		ds.close(dbConn);
		return tempOrder;
	}
	
	public ArrayList<order> queryOrderFoodInfo(String orderID) throws Exception{
		
		ArrayList<order> list = new ArrayList<order>();
			
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		String sql = "select * from orderFood where orderID = ?";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, orderID);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			order tempOrder = new order();
			tempOrder.setOrderID(rs.getString("orderID"));
			tempOrder.setFoodName(rs.getString("foodName"));
			tempOrder.setFoodNum(rs.getString("foodNum"));
			tempOrder.setFoodXiaoji(rs.getString("foodXiaoji"));
			list.add(tempOrder);
		}
		rs.close();
		ds.close(dbConn);
		return list;
	}
	
	public boolean addOrderInfo(order od) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		
		String sql = "insert into orderInfo values (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, od.getOrderID());
		pstmt.setString(2, od.getShopName());
		pstmt.setString(3, od.getConsumerName());
		pstmt.setString(4, od.getOrderState());
		pstmt.setString(5, od.getOrderTel());
		pstmt.setString(6, od.getOrderAddress());
		pstmt.setString(7, od.getOrderTime());
		pstmt.setString(8, od.getOrderPayStyle());
		pstmt.setString(9, od.getOrderPaySumPrice());
		pstmt.setString(10, od.getOrderYouhui());
		pstmt.setString(11, od.getOrderShiFu());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
	
	public boolean addOrderFoodInfo(order od) throws Exception{
		DataSource ds = new DataSource();
		Connection dbConn = ds.getConnection();
		
		String sql = "insert into orderFood values (?,?,?,?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		
		pstmt.setString(1, od.getOrderID());
		pstmt.setString(2, od.getShopName());
		pstmt.setString(3, od.getFoodName());
		pstmt.setString(4, od.getFoodNum());
		pstmt.setString(5, od.getFoodXiaoji());
		int result = pstmt.executeUpdate();
		if(result == 1){
			return true;
		}
		pstmt.close();
		dbConn.close();
		return false;
	}
}
