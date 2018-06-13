package javaWebDesign.service;

import javaWebDesign.dao.addUserDao;
import javaWebDesign.model.user;

public class addService {
	public boolean sendInfo(user user) throws Exception{
		boolean flag = false;
		addUserDao rd = new addUserDao();
		if(rd.saveUserinfo(user)) {
			flag = true;
		}
		return flag;
	}
}
