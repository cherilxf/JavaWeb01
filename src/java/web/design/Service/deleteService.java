package java.web.design.Service;

import java.web.design.Dao.deleteUserDao;

public class deleteService {
	public boolean sendName(String name) throws Exception{
		deleteUserDao rd = new deleteUserDao();
		if(rd.deleteInfo(name)) {
			return true;
		}
		return false;
	}
}
