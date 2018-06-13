package javaWebDesign.ctrl;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.user;
import javaWebDesign.service.userServicePage;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class PageQueryCtrl
 */
@WebServlet("/pageQueryCtrl")
public class pageQueryCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public pageQueryCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		userServicePage usp = new userServicePage();
		
		int page = 1;
		String pageStr = request.getParameter("page");
		if(pageStr != null) {
			page = java.lang.Integer.parseInt(pageStr);
		}
		
		int pageSize = 4;
		int totalpages = 0;
		
		ArrayList<user> list = new ArrayList<user>();
		try {
			list = usp.getAllUser();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		int totalsize = list.size();
		totalpages = (int)Math.ceil(totalsize/(pageSize*1.0));
		
		ArrayList<user> curlist = new ArrayList<user>();
		try {
			curlist = usp.getUserByPage(page-1,pageSize);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		JSONArray jsonArray = new JSONArray();
		JSONObject jo = new JSONObject();
		jo.put("page",page);
		jo.put("totalpages",totalpages);
		jsonArray.add(jo);
		
		for(user tmpUser : curlist) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("username", tmpUser.getUserName());
			jsonObject.put("password", tmpUser.getPassWord());
			jsonObject.put("age", tmpUser.getAge());
			jsonObject.put("tel", tmpUser.getTel());
			jsonObject.put("wechat", tmpUser.getWeChat());
			jsonArray.add(jsonObject);
		}
		out.println(jsonArray);
		
//		request.setAttribute("userList", curlist);
//		request.setAttribute("page", page);
//		request.setAttribute("totalPages", totalpages);
//		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
