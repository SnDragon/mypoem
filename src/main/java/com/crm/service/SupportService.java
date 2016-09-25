package com.crm.service;

import com.crm.model.Support;

public interface SupportService {

	boolean isSupportExisted(Integer userId, Integer poemId);

	boolean addSupport(Support support);

	boolean removeSupport(Support support);

}
