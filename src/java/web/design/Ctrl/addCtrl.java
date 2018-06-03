package java.web.design.Ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.web.design.Model.user;
import java.web.design.Service.addService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class addCtrl
 */
@WebServlet("/addCtrl")
public class addCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		user user = new user();
		user.setUserName(request.getParameter("addName"));
		user.setPassWord(request.getParameter("addPw"));
		user.setAge(request.getParameter("addAge"));
		user.setTel(request.getParameter("addTel"));
		user.setWeChat(request.getParameter("addWechat"));
		
		boolean flag = false;
		addService ls = new addService();
		try {
			if (ls.sendInfo(user)) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("state", flag);
		out.print(jsonObject);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
