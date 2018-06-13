package javaWebDesign.service;

import javaWebDesign.dao.loginDao;
import javaWebDesign.dao.registerDao;
import javaWebDesign.model.loginUser;

public class registerService {
	public boolean checkName(loginUser loginuser) throws Exception{
		loginDao ld = new loginDao();
		loginUser dbUser = null;
		String name = loginuser.getUserName();
		boolean exist = true;

		if(loginuser.getUserType().equals("consumer")) {
			dbUser = ld.queryConsumer(loginuser.getUserName());
		}else if(loginuser.getUserType().equals("shop")){
			dbUser = ld.queryShop(loginuser.getUserName());
		}else if(loginuser.getUserType().equals("operator")) {
			dbUser = ld.queryOperator(loginuser.getUserName());
		}
		
		if(name.equals(dbUser.getUserName())) {
			exist = true;
		}
		return exist;
	}
	
	public boolean addInfo(loginUser loginuser) throws Exception{
		boolean flag = false;
		registerDao rd = new registerDao();
		
		if(loginuser.getUserType().equals("consumer")) {
			flag = rd.addConsumer(loginuser);
		}else if(loginuser.getUserType().equals("shop")){
			flag = rd.addShop(loginuser);
		}else if(loginuser.getUserType().equals("operator")) {
			flag = rd.addOperator(loginuser);
		}
		
		return flag;
	}
	
//	public static void main(String[] args) throws Exception {
//		RegisterService rs = new RegisterService();
//		User user = rs.checkName("admin");
//		System.out.println(rs.user.getPassWord());
//	}
}
