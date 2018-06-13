package javaWebDesign.model;

public class user {

	private String username;
	private String password;
	private String age;
	private String tel;
	private String wechat;
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	
	public String getPassWord() {
		return password;
	}
	public void setPassWord(String password) {
		this.password = password;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getWeChat() {
		return wechat;
	}	
	public void setWeChat(String wechat) {
		this.wechat = wechat;
	}
}
