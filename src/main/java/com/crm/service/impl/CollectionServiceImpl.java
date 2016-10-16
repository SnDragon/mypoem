package com.crm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.CollectionDao;
import com.crm.model.Collection;
import com.crm.service.CollectionService;
import com.crm.util.CollectionUtil;
import com.crm.util.PageUtil;
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
	@Override
	public int getCollectionNumberById(Integer uid) {
		if(uid==null){
			return 0;
		}else{
			return collectionDao.getCollectionNumberById(uid);
		}
	}
	@Override
	public ArrayList<CollectionUtil> getCollectionsByPage(String page, Integer uid) {
		int pageInt=0;
		if(page==null || "".equals(page.trim())){
			pageInt=1;
		}else{
			pageInt=Integer.parseInt(page);
		}
		if(pageInt<1){
			pageInt=1;
		}
		
		int begin=PageUtil.COLLECTIONPERPAGE*(pageInt-1);
		ArrayList<CollectionUtil> collectionList=collectionDao.getCollectionPoemsByPage(uid,begin,PageUtil.COLLECTIONPERPAGE);
		for(CollectionUtil collection:collectionList){
			String poemText=collection.getPoemText();
			collection.setPoemText(poemText.replaceAll("\\|", " "));
		}
		
		return collectionList;
		
	}
	@Override
	public CollectionUtil getCollectionByPageNum(String page, String userId) {
		int pageInt=Integer.parseInt(page);
		int uid=Integer.parseInt(userId);
		int number=pageInt*PageUtil.COLLECTIONPERPAGE-1;
		return collectionDao.getCollectionByPageNum(uid, number);
	}

}
