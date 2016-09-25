package com.crm.dao;

import com.crm.model.Support;

public interface SupportDao {

	Support getSupportByUPId(Integer userId, Integer poemId);

	int insertSupport(Support support);

	int removeSupport(Support support);

}
