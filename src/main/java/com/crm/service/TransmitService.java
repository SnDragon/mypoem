package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Transmit;
import com.crm.util.TransmitUtil;

public interface TransmitService {
	public boolean addTransmit(Transmit transmit);

	public int getTransmitionNumberByUId(Integer uid);

	public ArrayList<TransmitUtil> getTransmitsByPage(String page, Integer uid);

	public boolean removeTransmitById(Integer transmitId);

	public boolean addTransmitSupport(Integer transmitId);

	public boolean subTransmitSupport(Integer transmitId);

	public boolean addComment(Integer poemId);

	public boolean subComment(int pid, int num);
}
