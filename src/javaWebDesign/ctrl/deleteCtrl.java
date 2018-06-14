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
import javaWebDesign.service.deleteService;
import javaWebDesign.service.foodService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class deleteCtrl
 */
@WebServlet("/deleteCtrl")
public class deleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String fn = request.getParameter("fn");
		if(fn.equals("loadInfo")) {
			foodService ds = new foodService();
			ArrayList<user> list = new ArrayList<user>();
			try {
//				list = ds.getAllUser();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			JSONArray jsonArray = new JSONArray();
			for(user tmpUser: list) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("username", tmpUser.getUserName());
				jsonObject.put("password", tmpUser.getPassWord());
				jsonObject.put("age", tmpUser.getAge());
				jsonObject.put("tel", tmpUser.getTel());
				jsonObject.put("wechat", tmpUser.getWeChat());
				jsonArray.add(jsonObject);
			}
			
			PrintWriter out = response.getWriter();
			out.println(jsonArray);
		}else if(fn.equals("deleteInfo")) {
			String username = request.getParameter("username");
			deleteService ds = new deleteService();
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			try {
				flag = ds.sendName(username);
				jsonObject.put("state", flag);
			}catch(Exception e) {
				e.printStackTrace();
			}
			PrintWriter out = response.getWriter();
			out.println(jsonObject);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
