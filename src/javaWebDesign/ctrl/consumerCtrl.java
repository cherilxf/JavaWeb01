package javaWebDesign.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaWebDesign.model.consumer;
import javaWebDesign.service.consumerService;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class consumerCtrl
 */
@WebServlet("/consumerCtrl")
public class consumerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public consumerCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		String fn = request.getParameter("fn");
		consumerService cs = new consumerService();
		
		if(fn.equals("checkInfo")) {
			String consumerID = request.getParameter("consumerID");
			consumer consumerInfo = new consumer();
			JSONObject jsonObject = new JSONObject();
			try {
				consumerInfo = cs.getConsumer(consumerID);
				jsonObject.put("consumerID", consumerInfo.getConsumerID());
				jsonObject.put("consumerName", consumerInfo.getConsumerName());
				jsonObject.put("nichen", consumerInfo.getNichen());
				jsonObject.put("conaumerAge", consumerInfo.getAge());
				jsonObject.put("consumerTel", consumerInfo.getTel());
				jsonObject.put("consumerWechat", consumerInfo.getWechat());
			}catch(Exception e) {
				e.printStackTrace();
			}
			out.println(jsonObject);
		}else if(fn.equals("setInfo")) {
			String consumerID = request.getParameter("consumerID");
			String consumerName = request.getParameter("consumerName");
			String nichen = request.getParameter("nichen");
			String consumerAge = request.getParameter("consumerAge");
			String consumerTel = request.getParameter("consumerTel");
			String consumerWechat = request.getParameter("consumerWechat");
			
			consumer con = new consumer();
			con.setConsumerID(consumerID);
			con.setConsumerName(consumerName);
			con.setNichen(nichen);
			con.setAge(consumerAge);
			con.setTel(consumerTel);
			con.setWechat(consumerWechat);
			
			boolean state = true;
			JSONObject jsonObject = new JSONObject();
			try {
				state = cs.setConsumer(con);
				jsonObject.put("state", state);
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
