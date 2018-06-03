package java.web.design.Service;

import java.web.design.Dao.loginDao;
import java.web.design.Model.user;

public class loginService {
//		private User user;
		
		// 判断用户输入的用户名和密码与数据库的数据是否一致
		public boolean checkLogin(user user) throws Exception{
			boolean exist = false;
			loginDao ld = new loginDao();
			
			String userName = user.getUserName();
			String passWord = user.getPassWord();
			user dbUser = ld.queryUser(userName);
			
			// 比较是否合法
			if(dbUser != null && user.getPassWord().equals(dbUser.getPassWord())) {
				exist = true;
			}
			return exist;
		}
		
//		public static void main(String[] args) throws Exception {
//			User user = new User();
//			user.setUserName("liao");
//			user.setPassWord("123456");
//			LoginService ld = new LoginService();
//			boolean flag = ld.checkLogin(user);
//			System.out.println(flag);
//		}
}
