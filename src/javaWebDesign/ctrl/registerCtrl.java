package javaWebDesign.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.loginUser;
import javaWebDesign.model.user;
import javaWebDesign.service.registerService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class RegisterCtrl
 */
@WebServlet("/registerCtrl")
public class registerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");

		String fn = request.getParameter("fn");
		if(fn.equals("checkName")) {
			String usertype = request.getParameter("userType");
			String username = request.getParameter("userName");
			loginUser loginuser = new loginUser();
			loginuser.setUserType(usertype);
			loginuser.setUserName(username);
			JSONObject jsonObject = new JSONObject();
			registerService ls = new registerService();
			
			boolean flag = false;
			try {
				flag = ls.checkName(loginuser);
			} catch (Exception e) {
				e.printStackTrace();
			}

			PrintWriter out = response.getWriter();
			jsonObject.put("state", flag);
			out.println(jsonObject);
			out.close();
		}else if(fn.equals("register")) {
			JSONObject jsonObject = new JSONObject();
			String usertype = request.getParameter("userType");
			String username = request.getParameter("userName");
			String password = request.getParameter("passWord");
			loginUser loginuser = new loginUser();
			loginuser.setUserType(usertype);
			loginuser.setUserName(username);
			loginuser.setPassWord(password);
			registerService ls = new registerService();
			
			boolean flag = false;
			try {
				flag = ls.addInfo(loginuser);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			PrintWriter out = response.getWriter();
			jsonObject.put("state", flag);
			out.println(jsonObject);
			out.close();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
