package java.web.design.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.web.design.Model.user;
import java.web.design.Service.registerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class RegisterCtrl
 */
@WebServlet("/RegisterCtrl")
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

		PrintWriter out = response.getWriter();
		String fn = request.getParameter("fn");
		if(fn.equals("checkName")) {
			JSONObject jsonObject = new JSONObject();
			String userName = request.getParameter("userName");
			registerService ls = new registerService();
			boolean flag = false;
			try {
				flag = ls.checkName(userName);
				jsonObject.put("state", flag);
			} catch (Exception e) {
				e.printStackTrace();
			}

			out.println(jsonObject);
			out.close();
		}else if(fn.equals("register")) {
			JSONObject jsonObject = new JSONObject();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			user user = new user();
			user.setUserName(username);
			user.setPassWord(password);
			registerService ls = new registerService();
			
			boolean flag = false;
			try {
				flag = ls.jRegister(user);
				jsonObject.put("state", flag);
			} catch (Exception e) {
				e.printStackTrace();
			}
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
