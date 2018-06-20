package javaWebDesign.service;

import javaWebDesign.dao.consumerDao;
import javaWebDesign.model.consumer;

public class consumerService {
	consumerDao cd = new consumerDao();
	
	public consumer getConsumer(String consumerID) throws Exception{
		consumer consumer = new consumer();
		consumer = cd.queryConsumer(consumerID);
		return consumer;
	}
	
	public boolean setConsumer(consumer con) throws Exception{
		boolean state = false;
		state = cd.setConsumerInfo(con);
		return state;
	}
}
