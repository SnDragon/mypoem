package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.Transmit;
import com.crm.util.TransmitUtil;

public interface TransmitDao {

	int insertTransmit(Transmit transmit);

	int getTransmitionNumberByUId(Integer uid);

	ArrayList<TransmitUtil> getTransmitsByPage(Integer uid, int begin, int length);

	int removeTransmitById(Integer transmitId);
	
}
