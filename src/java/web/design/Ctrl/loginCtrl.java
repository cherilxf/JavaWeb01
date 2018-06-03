package java.web.design.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.web.design.Model.user;
import java.web.design.Service.loginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet("/LoginCtrl")
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
		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
				
		// 打包数据
		user user = new user();
		user.setUserName(userName);
		user.setPassWord(passWord);
				
		loginService ls = new loginService();
		
		try{
			boolean flag = ls.checkLogin(user);
			if(flag) {
				Cookie cookie = new Cookie(userName,passWord);
				response.addCookie(cookie);
				jsonObject.put("state", true);
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
