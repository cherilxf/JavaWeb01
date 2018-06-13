package javaWebDesign.service;

import javaWebDesign.dao.operatorDao;
import javaWebDesign.model.operatorInfo;

public class operatorService {
	operatorDao oDao = new operatorDao();
	
	public  operatorInfo getOperatorInfo(String account) throws Exception{
		operatorInfo oInfo = oDao.queryOperatorInfo(account);
		return oInfo;
	}
	
	public  boolean sendInfo(operatorInfo oInfo) throws Exception{
		boolean flag = false;
		operatorDao oDao = new operatorDao();
		if(oDao.setInfo(oInfo)) {
			flag = true;
		}
		return flag;
	}
}
