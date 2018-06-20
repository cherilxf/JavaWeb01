package javaWebDesign.ctrl;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.food;
import javaWebDesign.model.shop;
import javaWebDesign.service.foodService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PageQueryCtrl
 */
@WebServlet("/foodCtrl")
public class foodCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public foodCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		
		String sort = request.getParameter("sort");
		String info = request.getParameter("info");
		foodService fs = new foodService();
		
		JSONArray jsonArray = new JSONArray();
		
		if(info.equals("shop")) {
			ArrayList<shop> list = new ArrayList<shop>();
			try {
				list = fs.getAllShop(sort);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			for(shop tmpUser : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("shopImg", tmpUser.getShopImg());
				jsonObject.put("shopName", tmpUser.getShopName());
				jsonObject.put("pingfen", tmpUser.getPingfen());
				jsonObject.put("sale", tmpUser.getSale());
				jsonObject.put("youhui", tmpUser.getYouhui());
				jsonArray.add(jsonObject);
			}
			
		}else if(info.equals("food")) {
			ArrayList<food> list = new ArrayList<food>();
			try {
				list = fs.getAllFood(sort);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			for(food tmpUser : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("foodImg", tmpUser.getFoodImg());
				jsonObject.put("foodName", tmpUser.getFoodName());
				jsonObject.put("foodUnitPrice", tmpUser.getFoodUnitPrice());
				jsonArray.add(jsonObject);
			}
		}else if(info.equals("shopFood")) {
			String shopName = request.getParameter("shopName");
			ArrayList<food> list = new ArrayList<food>();
			try {
				list = fs.getShopFood(shopName);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			for(food tmpUser : list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("foodImg", tmpUser.getFoodImg());
				jsonObject.put("foodName", tmpUser.getFoodName());
				jsonObject.put("foodUnitPrice", tmpUser.getFoodUnitPrice());
				jsonArray.add(jsonObject);
			}
		}
		
		PrintWriter out = response.getWriter();
		out.println(jsonArray);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
