package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.Collection;
import com.crm.util.CollectionUtil;

public interface CollectionDao {

	int insertCollection(Collection collection);

	boolean removeCollection(Collection collection);

	Collection getCollectionByUPId(Integer userId, Integer poemId);

	int getCollectionNumberById(Integer uid);

	ArrayList<CollectionUtil> getCollectionPoemsByPage(Integer uid, int begin, int collectionperpage);

	CollectionUtil getCollectionByPageNum(int uid, int number);

}
