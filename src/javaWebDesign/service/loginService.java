package javaWebDesign.service;

import javaWebDesign.dao.loginDao;
import javaWebDesign.model.loginUser;

public class loginService {
		// 判断用户输入的用户名和密码与数据库的数据是否一致
		public boolean checkLogin(loginUser loginUser) throws Exception{
			boolean exist = false;
			loginDao ld = new loginDao();
			loginUser dbUser = null;

			if(loginUser.getUserType().equals("consumer")) {
				dbUser = ld.queryConsumer(loginUser.getUserName());
			}else if(loginUser.getUserType().equals("shop")){
				dbUser = ld.queryShop(loginUser.getUserName());
			}else if(loginUser.getUserType().equals("operator")) {
				dbUser = ld.queryOperator(loginUser.getUserName());
			}
			// 比较是否合法
			if(dbUser != null && loginUser.getPassWord().equals(dbUser.getPassWord())) {
				exist = true;
			}
			return exist;
		}
}
