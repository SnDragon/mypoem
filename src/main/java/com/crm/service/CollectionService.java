package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Collection;
import com.crm.util.CollectionUtil;

public interface CollectionService {

	public boolean addCollection(Collection collection);

	public boolean removeCollection(Collection collection);

	public boolean isCollectionExisted(Integer userId, Integer poemId);

	public int getCollectionNumberById(Integer uid);

	public ArrayList<CollectionUtil> getCollectionsByPage(String page, Integer uid);

	public CollectionUtil getCollectionByPageNum(String page, String userId);
	
}
