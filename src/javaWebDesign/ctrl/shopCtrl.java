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
import javaWebDesign.service.shopService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class shopCtrl
 */
@WebServlet("/shopCtrl")
public class shopCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String fn = request.getParameter("fn");
		shopService ss = new shopService();
		
		if(fn.equals("shopCheck")) {
			String shopID = request.getParameter("shopID");
			shop shopInfo = new shop();
			JSONObject jsonObject = new JSONObject();
			try {
				shopInfo = ss.getShopByID(shopID);
				jsonObject.put("shopID", shopInfo.getShopID());
				jsonObject.put("shopName", shopInfo.getShopName());
				jsonObject.put("shopAddress", shopInfo.getShopAddress());
				jsonObject.put("peisongFee", shopInfo.getPeisongFee());
				jsonObject.put("canheFee", shopInfo.getCanheFee());
				jsonObject.put("pingfen", shopInfo.getPingfen());
				jsonObject.put("sale", shopInfo.getSale());
				jsonObject.put("youhui", shopInfo.getYouhui());
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
			
		}else if(fn.equals("shopSearch")) {
			String shopName = request.getParameter("shopName");
			shop shopInfo = new shop();
			JSONObject jsonObject = new JSONObject();
			try {
				shopInfo = ss.getShopByName(shopName);
				jsonObject.put("shopID", shopInfo.getShopID());
				jsonObject.put("shopName", shopInfo.getShopName());
				jsonObject.put("shopAddress", shopInfo.getShopAddress());
				jsonObject.put("peisongFee", shopInfo.getPeisongFee());
				jsonObject.put("canheFee", shopInfo.getCanheFee());
				jsonObject.put("pingfen", shopInfo.getPingfen());
				jsonObject.put("sale", shopInfo.getSale());
				jsonObject.put("youhui", shopInfo.getYouhui());
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
			
		}else if(fn.equals("foodCheck")) {
			int page = 1;
			String pageStr = request.getParameter("page");
			String shopName = request.getParameter("shopName");
			if(pageStr != null) {
				page = java.lang.Integer.parseInt(pageStr);
			}
			
			int pageSize = 5;
			int totalpages = 0;
			
			ArrayList<food> list = new ArrayList<food>();
			try {
				list = ss.getFoodInfo(shopName);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			int totalsize = list.size();
			totalpages = (int)Math.ceil(totalsize/(pageSize*1.0));
			
			ArrayList<food> curlist = new ArrayList<food>();
			try {
				curlist = ss.getFoodByPage(page-1,pageSize,shopName);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			JSONArray jsonArray = new JSONArray();
			JSONObject jo = new JSONObject();
			jo.put("page",page);
			jo.put("totalpages",totalpages);
			jsonArray.add(jo);
			
			for(food tmpFood : curlist) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("foodImg", tmpFood.getFoodImg());
				jsonObject.put("foodName", tmpFood.getFoodName());
				jsonObject.put("foodUnitPrice", tmpFood.getFoodUnitPrice());
				jsonArray.add(jsonObject);
			}
			out.println(jsonArray);
		}else if(fn.equals("addFood")) {
			String shopName = request.getParameter("shopName");
			String foodName = request.getParameter("foodName");
			String foodUnitPrice = request.getParameter("foodUnitPrice");
			
			food food = new food();
			food.setShopName(shopName);
			food.setFoodName(foodName);
			food.setFoodUnitPrice(foodUnitPrice);
			
			JSONObject jsonObject = new JSONObject();
			try {
				if(ss.addFood(food)) {
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
