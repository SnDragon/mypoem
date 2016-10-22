package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Transmit;
import com.crm.util.TransmitUtil;

public interface TransmitService {
	public boolean addTransmit(Transmit transmit);

	public int getTransmitionNumberByUId(Integer uid);

	public ArrayList<TransmitUtil> getTransmitsByPage(String page, Integer uid);

	public boolean removeTransmitById(Integer transmitId);
}
