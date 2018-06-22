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
		PrintWriter out = response.getWriter();
		
		if(fn.equals("checkInfo")) {
			String operatorID = request.getParameter("operatorID");
			
			operatorService os = new operatorService();
			operatorInfo info = new operatorInfo();
			
			try {
				info = os.getOperatorInfo(operatorID);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			JSONObject jo = new JSONObject();
			if(info != null) {
				jo.put("operatorID", info.getOperatorID());
				jo.put("name", info.getName());
				jo.put("age", info.getAge());
				jo.put("sex", info.getSex());
				jo.put("tel", info.getTel());
				jo.put("wechat", info.getWechat());
			}
			out.println(jo);
		}
//		}else if(fn.equals("setInfo")){
//			operatorInfo Info = new operatorInfo();
//			Info.setOperatorID(request.getParameter("operatorID"));
//			Info.setName(request.getParameter("name"));
//			Info.setAge(request.getParameter("age"));
//			Info.setSex(request.getParameter("sex"));
//			Info.setTel(request.getParameter("tel"));
//			Info.setWechat(request.getParameter("wechat"));
//			
//			boolean flag = false;
//			operatorService oService = new operatorService();
//			try {
//				if (oService.sendInfo(Info)) {
//					flag = true;
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			JSONObject jsonObject = new JSONObject();
//			jsonObject.put("state", flag);
//			out.print(jsonObject);
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
