package com.crm.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.crm.dao.TransmitDao;
import com.crm.model.Transmit;
import com.crm.service.PoemService;
import com.crm.service.TransmitService;
import com.crm.util.PageUtil;
import com.crm.util.TransmitUtil;
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
	@Override
	public int getTransmitionNumberByUId(Integer uid) {
		return transmitDao.getTransmitionNumberByUId(uid);
	}
	@Override
	public ArrayList<TransmitUtil> getTransmitsByPage(String page, Integer uid) {
		int pageInt=0;
		if(page==null || "".equals(page)){
			pageInt=1;
		}else{
			pageInt=Integer.parseInt(page);
		}
		if(pageInt<1){
			pageInt=1;
		}
		
		int begin=PageUtil.TRANSMITPERPAGE*(pageInt-1);
		return transmitDao.getTransmitsByPage(uid,begin,PageUtil.TRANSMITPERPAGE);
	}
	@Override
	public boolean removeTransmitById(Integer transmitId) {
		if(transmitId==null){
			return false;
		}
		if(transmitDao.removeTransmitById(transmitId)>0){
			return true;
		}else{
			return false;
		}
	}

}
