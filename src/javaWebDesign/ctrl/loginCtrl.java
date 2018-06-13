package javaWebDesign.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaWebDesign.model.loginUser;
import javaWebDesign.model.user;
import javaWebDesign.service.loginService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet("/loginCtrl")
public class loginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		
		// 接收从前端传来的数据
		String userType = request.getParameter("userType");
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");

		// 打包数据
		loginUser loginuser = new loginUser();
		loginuser.setUserType(userType);
		loginuser.setUserName(userName);
		loginuser.setPassWord(passWord);
				
		loginService ls = new loginService();
		HttpSession session = request.getSession();
		
		try{
			boolean flag = ls.checkLogin(loginuser);
			if(flag) {
				session.setAttribute("username", userName);
				jsonObject.put("state", true);
				jsonObject.put("account", userName);
			}else {
				jsonObject.put("state", false);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		out.println(jsonObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
