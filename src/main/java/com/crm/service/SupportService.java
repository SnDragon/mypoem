package com.crm.service;

import com.crm.model.Support;
import com.crm.model.TransmitSupport;

public interface SupportService {

	boolean isSupportExisted(Integer userId, Integer poemId);

	boolean addSupport(Support support);

	boolean removeSupport(Support support);

	boolean isTransmitSupportExisted(Integer uid, Integer transmitId);

	boolean addTransmitSupport(TransmitSupport support);

	boolean removeTransmitSupport(TransmitSupport support);

}
