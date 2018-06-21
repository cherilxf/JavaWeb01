package javaWebDesign.service;

import java.util.ArrayList;

import javaWebDesign.dao.orderDao;
import javaWebDesign.model.order;

public class orderService {
	orderDao od = new orderDao();
	
	// 获得简单信息查询
	public ArrayList<order> getOrder(String consumerName) throws Exception{
		ArrayList<order> listOrder = new ArrayList<order>();
		listOrder = od.queryOrder(consumerName);
		return listOrder;
	}
	
	// 获得详细信息查询
	public order getOrderInfo(String orderID) throws Exception{
		order orderInfo = new order();
		orderInfo = od.queryOrderInfo(orderID);
		return orderInfo;
	}
	public ArrayList<order> getOrderFoodInfo(String orderID) throws Exception{
		ArrayList<order> listOrderFoodInfo = new ArrayList<order>();
		listOrderFoodInfo = od.queryOrderFoodInfo(orderID);
		return listOrderFoodInfo;
	}
	
	public boolean addOrder(order order) throws Exception{
		boolean flag = false;
		if(od.addOrderInfo(order)) {
			flag = true;
		}
		return flag;
	}
	
	public boolean addOrderFood(order order) throws Exception{
		boolean flag = false;
		if(od.addOrderFoodInfo(order)) {
			flag = true;
		}
		return flag;
	}
	
	public boolean confirmOrder(String orderID) throws Exception{
		boolean flag = false;
		if(od.changeState(orderID)) {
			flag = true;
		}
		return flag;
	}
}
