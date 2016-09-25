package com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.CollectionDao;
import com.crm.model.Collection;
import com.crm.service.CollectionService;
@Service("collectionService")
public class CollectionServiceImpl implements CollectionService{
	@Resource
	private CollectionDao collectionDao;
	@Override
	public boolean addCollection(Collection collection) {
		if(collection.getUserId()==null || collection.getPoemId()==null){
			return false;
		}
		if(collectionDao.insertCollection(collection)>0){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean removeCollection(Collection collection) {
		if(collection.getUserId()==null || collection.getPoemId()==null){
			return false;
		}
		if(collectionDao.removeCollection(collection)){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public boolean isCollectionExisted(Integer userId, Integer poemId) {
		if(userId==null || poemId==null){
			return false;
		}
		if(collectionDao.getCollectionByUPId(userId,poemId)!=null){
			return true;
		}else{
			return false;
		}
	}

}
