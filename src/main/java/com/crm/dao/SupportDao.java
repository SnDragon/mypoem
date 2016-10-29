package com.crm.dao;

import com.crm.model.Support;
import com.crm.model.TransmitSupport;

public interface SupportDao {

	Support getSupportByUPId(Integer userId, Integer poemId);

	int insertSupport(Support support);

	int removeSupport(Support support);

	int getTransmitSupportByUPId(Integer uid, Integer transmitId);

	int addTransmitSupport(TransmitSupport support);

	int removeTransmitSupport(TransmitSupport support);

}
