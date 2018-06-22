package javaWebDesign.service;

import javaWebDesign.dao.operatorDao;
import javaWebDesign.model.operatorInfo;

public class operatorService {
	operatorDao od = new operatorDao();
	
	public  operatorInfo getOperatorInfo(String operatorID) throws Exception{
		operatorInfo oInfo = od.queryOperatorInfo(operatorID);
		return oInfo;
	}
	
//	public  boolean sendInfo(operatorInfo Info) throws Exception{
//		boolean flag = false;
//		if(od.setInfo(Info)) {
//			flag = true;
//		}
//		return flag;
//	}
}
