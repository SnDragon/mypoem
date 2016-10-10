package com.crm.service.impl;

import java.sql.Timestamp;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.crm.dao.TransmitDao;
import com.crm.model.Transmit;
import com.crm.service.PoemService;
import com.crm.service.TransmitService;
@Service("transmitService")
public class TransmitServiceImpl implements TransmitService{
	
	@Resource
	private TransmitDao transmitDao;
	@Resource 
	private PoemService poemService;
	@Override
	public boolean addTransmit(Transmit transmit) {
		if(transmit==null){
			return false;
		}
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		transmit.setTransmitTime(timestamp);
		
		//此处应该使用事务
		if(transmitDao.insertTransmit(transmit)>0 && poemService.addTransmit(transmit.getPoemId())){
			return true;
		}else{
			return false;
		}
	}

}
