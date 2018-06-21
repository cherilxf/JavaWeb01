package javaWebDesign.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.order;
import javaWebDesign.service.orderService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class orderCtrl
 */
@WebServlet("/orderCtrl")
public class orderCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public orderCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		
		String fn = request.getParameter("fn");
		orderService os = new orderService();
		PrintWriter out = response.getWriter();
		JSONArray jsonArray = new JSONArray();
		
		
		if(fn.equals("getOrder")) {
			String consumerName = request.getParameter("consumerName");
			ArrayList<order> listOrder = new ArrayList<order>();
			try {
				listOrder = os.getOrder(consumerName);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			for(order tmpOrder1 : listOrder) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("orderID", tmpOrder1.getOrderID());
				jsonObject.put("shopName", tmpOrder1.getShopName());
				jsonObject.put("consumerName", tmpOrder1.getConsumerName());
				jsonObject.put("orderState", tmpOrder1.getOrderState());
				jsonObject.put("orderTel", tmpOrder1.getOrderTel());
				jsonObject.put("orderAddress", tmpOrder1.getOrderAddress());
				jsonObject.put("orderTime", tmpOrder1.getOrderTime());
				jsonObject.put("orderPayStyle", tmpOrder1.getOrderPayStyle());
				jsonObject.put("orderPaySumPrice", tmpOrder1.getOrderPaySumPrice());
				jsonObject.put("orderYouhui", tmpOrder1.getOrderYouhui());
				jsonObject.put("orderShiFu", tmpOrder1.getOrderShiFu());

				jsonArray.add(jsonObject);
			}
			out.println(jsonArray);
			
		}else if(fn.equals("addOrder")) {
			String orderID = request.getParameter("orderID");
			String shopName = request.getParameter("shopName");
			String consumerName = request.getParameter("consumerName");
			String orderState = request.getParameter("orderState");
			String orderAddress = request.getParameter("orderAddress");
			String orderTel = request.getParameter("orderTel");
			String orderTime = request.getParameter("orderTime");
			String orderPayStyle = request.getParameter("orderPayStyle");
			String orderPaySumPrice = request.getParameter("orderPaySumPrice");
			String orderYouhui = request.getParameter("orderYouhui");
			String orderShiFu = request.getParameter("orderShiFu");
			String arrFood = request.getParameter("arrFood");
			order od = new order();
			od.setOrderID(orderID);
			od.setShopName(shopName);
			od.setConsumerName(consumerName);
			od.setOrderState(orderState);
			od.setOrderAddress(orderAddress);
			od.setOrderTel(orderTel);
			od.setOrderTime(orderTime);
			od.setOrderPayStyle(orderPayStyle);
			od.setOrderPaySumPrice(orderPaySumPrice);
			od.setOrderYouhui(orderYouhui);
			od.setOrderShiFu(orderShiFu);
			
			JSONObject jsonObject = new JSONObject();
			try {
				if(os.addOrder(od)) {
					jsonObject.put("state", true);
				}else {
					jsonObject.put("state", false);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
			
		}else if(fn.equals("addOrderFood")) {
			String orderID = request.getParameter("orderID");
			String shopName = request.getParameter("shopName");
			String foodName = request.getParameter("foodName");
			String foodNum = request.getParameter("foodNum");
			String foodXiaoji = request.getParameter("foodXiaoji");
			order od = new order();
			od.setOrderID(orderID);
			od.setShopName(shopName);
			od.setFoodName(foodName);
			od.setFoodNum(foodNum);
			od.setFoodXiaoji(foodXiaoji);
			
			JSONObject jsonObject = new JSONObject();
			try {
				if(os.addOrderFood(od)) {
					jsonObject.put("state", true);
				}else {
					jsonObject.put("state", false);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
			
		}else if(fn.equals("getOrderInfo")) {
			String orderID = request.getParameter("orderID");
			
			order OrderInfo = new order();
			ArrayList<order> listOrderFoodInfo = new ArrayList<order>();
			try {
				OrderInfo = os.getOrderInfo(orderID);
				listOrderFoodInfo = os.getOrderFoodInfo(orderID);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("orderID", OrderInfo.getOrderID());
			jsonObject.put("shopName", OrderInfo.getShopName());
			jsonObject.put("consumerName", OrderInfo.getConsumerName());
			jsonObject.put("orderState", OrderInfo.getOrderState());
			jsonObject.put("orderTel", OrderInfo.getOrderTel());
			jsonObject.put("orderAddress", OrderInfo.getOrderAddress());
			jsonObject.put("orderTime", OrderInfo.getOrderTime());
			jsonObject.put("orderPayStyle", OrderInfo.getOrderPayStyle());
			jsonObject.put("orderPaySumPrice", OrderInfo.getOrderPaySumPrice());
			jsonObject.put("orderYouhui", OrderInfo.getOrderYouhui());
			jsonObject.put("orderShiFu", OrderInfo.getOrderShiFu());
			jsonObject.put("orderFood", listOrderFoodInfo);
			out.println(jsonObject);
		}else if(fn.equals("orderConfirm")) {
			String orderID = request.getParameter("orderID");
			
			JSONObject jsonObject = new JSONObject();
			try {
				if(os.confirmOrder(orderID)) {
					jsonObject.put("state", true);
				}else {
					jsonObject.put("state", false);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
