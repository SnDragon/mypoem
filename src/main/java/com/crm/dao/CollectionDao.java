package com.crm.dao;

import com.crm.model.Collection;

public interface CollectionDao {

	int insertCollection(Collection collection);

	boolean removeCollection(Collection collection);

	Collection getCollectionByUPId(Integer userId, Integer poemId);

}
