package java.web.design.Service;

import java.util.ArrayList;
import java.web.design.Dao.userDaoPage;
import java.web.design.Model.user;

public class userServicePage {
	userDaoPage udp = new userDaoPage();
	
	public ArrayList<user> getAllUser() throws Exception{
		ArrayList<user> list = new ArrayList<user>();
		list = udp.queryAllUser();
		return list;
	}
	
	public ArrayList<user> getUserByPage(int page,int pageSize) throws Exception{
		ArrayList<user> list = new ArrayList<user>();
		list = udp.queryUserByPage(page, pageSize);
		return list;
	}
}
