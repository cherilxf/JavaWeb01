package javaWebDesign.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.operatorInfo;
import javaWebDesign.service.operatorService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class operatorCtrl
 */
@WebServlet("/operatorCtrl")
public class operatorCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public operatorCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		String fn = request.getParameter("fn");
		
		if(fn.equals("checkInfo")) {
			String account = request.getParameter("account");
			
			operatorService oService = new operatorService();
			operatorInfo info = new operatorInfo();
			
			try {
				info = oService.getOperatorInfo(account);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			JSONObject jo = new JSONObject();
			if(info != null) {
				jo.put("name", info.getName());
				jo.put("account", info.getAccount());
				jo.put("age", info.getAge());
				jo.put("sex", info.getSex());
				jo.put("tel", info.getTel());
				jo.put("wechat", info.getWechat());
				jo.put("qq", info.getQq());
				jo.put("city", info.getCity());
				jo.put("job", info.getJob());
				jo.put("hobby", info.getHobby());
			}
			PrintWriter out = response.getWriter();
			out.println(jo);
		}else if(fn.equals("setInfo")){
			operatorInfo oInfo = new operatorInfo();
			oInfo.setName(request.getParameter("name"));
			oInfo.setAccount(request.getParameter("account"));
			oInfo.setAge(request.getParameter("age"));
			oInfo.setSex(request.getParameter("sex"));
			oInfo.setTel(request.getParameter("tel"));
			oInfo.setWechat(request.getParameter("wechat"));
			oInfo.setQq(request.getParameter("qq"));
			oInfo.setCity(request.getParameter("city"));
			oInfo.setJob(request.getParameter("job"));
			oInfo.setHobby(request.getParameter("hobby"));
			
			boolean flag = false;
			operatorService oService = new operatorService();
			try {
				if (oService.sendInfo(oInfo)) {
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
