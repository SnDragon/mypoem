package com.crm.service;

import com.crm.model.Collection;

public interface CollectionService {

	public boolean addCollection(Collection collection);

	public boolean removeCollection(Collection collection);

	public boolean isCollectionExisted(Integer userId, Integer poemId);
	
}
