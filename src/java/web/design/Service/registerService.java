package java.web.design.Service;

import java.web.design.Dao.registerDao;
import java.web.design.Model.user;

public class registerService {
//	private User user;
	public boolean checkName(String name) throws Exception{
		
		registerDao rd = new registerDao();
		user dbUser = rd.queryUser(name);
//		this.user = dbUser;
		if(dbUser != null && name.equals(dbUser.getUserName())) {
			return true;
		}
		return false;
	}
	
	public boolean jRegister(user user) throws Exception{
		boolean flag = false;
		registerDao rd = new registerDao();
		if(rd.saveUserinfo(user)) {
			flag = true;
		}
		return flag;
	}
	
//	public static void main(String[] args) throws Exception {
//		RegisterService rs = new RegisterService();
//		User user = rs.checkName("admin");
//		System.out.println(rs.user.getPassWord());
//	}
}
