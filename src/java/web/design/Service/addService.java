package java.web.design.Service;

import java.web.design.Dao.addUserDao;
import java.web.design.Model.user;

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
