package com.crm.service.impl;


import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.PoemDao;
import com.crm.model.OtherPoem;
import com.crm.model.Poem;
import com.crm.service.CollectionService;
import com.crm.service.PoemService;
import com.crm.service.SupportService;
import com.crm.util.HomeOtherPoemUtil;
import com.crm.util.HomePoemUtil;
import com.crm.util.PageUtil;
import com.crm.util.PoemUtil;
@Service("poemService")
@Transactional(propagation=Propagation.REQUIRED)
public class PoemServiceImpl implements PoemService{
	@Resource
	private PoemDao poemDao;
	@Resource 
	private CollectionService collectionService;
	@Resource 
	private SupportService supportService;
	
	
	@Override
	public Poem insertPoem(Poem poem) {
		Timestamp date=new Timestamp(System.currentTimeMillis());
		poem.setPoemPublishTime(date);
		String content=poem.getPoemText();
		if(content==null){
			return null;
		}
		System.out.println(content);
		//匹配空格，不是空白字符\s
		content=content.replaceAll(" ", "");
//		content=content.replaceAll("\\r\\n\\r\\n", "\r\n");
//		System.out.println(content);
		//content=content.replaceAll("\\r\\n", "|");
		//由于之前使用json传递过来，因此与直接使用getParameter相比，\r\n相当于\n
		content=content.replaceAll("\\n", "|");
		poem.setPoemText(content);

		if( "".equals(poem.getPoemText())){
			return null;
		}
		poem.setPoemTitle(poem.getPoemTitle().replaceAll("\\s", ""));
		if(poem.getPoemTitle()==null || "".equals(poem.getPoemTitle())){
			return null;
		}
		if("".equals(poem.getPoemImg())){
			poem.setPoemImg(null);
		}
		System.out.println(poem);
		if(poemDao.insertPoem(poem)>0){
			System.out.println(poem.getPoemId());
			return poem;
		}else{
			return null;
		}
	}


	@Override
	public Poem getPoemById(int id) {
		return poemDao.getPoemById(id);
	}

	@Override
	public ArrayList<PoemUtil> getPoemUtilsByUID(Integer uid) {
		if(uid==null){
			return null;
		}
		ArrayList<PoemUtil> poemUtils=poemDao.getPoemUtils();
		for(PoemUtil poemUtil:poemUtils){
			if(collectionService.isCollectionExisted(uid,poemUtil.getPoemId())){
				poemUtil.setIsCollected(true);
			}else{
				poemUtil.setIsCollected(false);
			}
			if(supportService.isSupportExisted(uid,poemUtil.getPoemId())){
				poemUtil.setIsSupported(true);
			}else{
				poemUtil.setIsSupported(false);
			}
		}
		for(PoemUtil poemUtil:poemUtils){
			System.out.println(poemUtil);
			String[] poemRow=poemUtil.getPoemText().split("\\|");
			poemUtil.setPoemRow(poemRow);
		}
		return poemUtils;
	}


	@Override
	public boolean addSupport(Integer poemId) {
		if(poemDao.addSupport(poemId)>0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public boolean subSupport(Integer poemId) {
		if(poemDao.subSupport(poemId)>0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public ArrayList<PoemUtil> getRecommendPoemUtils() {
		ArrayList<PoemUtil> poemUtils=poemDao.getPoemUtils();
		for(PoemUtil poemUtil:poemUtils){
			String[] poemRow=poemUtil.getPoemText().split("\\|");
			poemUtil.setPoemRow(poemRow);
		}
		return poemUtils;
	}


	@Override
	public PoemUtil getPoemUtilById(Integer userId, Integer pid) {
		if(userId==null || pid==null){
			return null;
		}
		PoemUtil poemUtil=poemDao.getPoemUtilById(pid);
		if(collectionService.isCollectionExisted(userId,poemUtil.getPoemId())){
			poemUtil.setIsCollected(true);
		}else{
			poemUtil.setIsCollected(false);
		}
		if(supportService.isSupportExisted(userId,poemUtil.getPoemId())){
			poemUtil.setIsSupported(true);
		}else{
			poemUtil.setIsSupported(false);
		}
		
		String[] poemRow=poemUtil.getPoemText().split("\\|");
		poemUtil.setPoemRow(poemRow);
		return poemUtil;
	}


	@Override
	public boolean addTransmit(Integer poemId) {
		if(poemId==null){
			return false;
		}
		if(poemDao.addTransmit(poemId)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean addComment(Integer poemId) {
		if(poemId==null){
			return false;
		}
		if(poemDao.addComment(poemId)>0){
			return true;
		}
		return false;
	}


	@Override
	public boolean subComment(int poemId,int num) {
		if(poemDao.subComment(poemId,num)>0){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public ArrayList<PoemUtil> getPoemUtilsByUUID(Integer userId, Integer aid) {
		if(userId==null || aid==null){
			return null;
		}
		ArrayList<PoemUtil> poemUtils=poemDao.getPoemUtilsByAId(aid);
		for(PoemUtil poemUtil:poemUtils){
			if(collectionService.isCollectionExisted(userId,poemUtil.getPoemId())){
				poemUtil.setIsCollected(true);
			}else{
				poemUtil.setIsCollected(false);
			}
			if(supportService.isSupportExisted(userId,poemUtil.getPoemId())){
				poemUtil.setIsSupported(true);
			}else{
				poemUtil.setIsSupported(false);
			}
		}
		for(PoemUtil poemUtil:poemUtils){
			System.out.println(poemUtil);
			String[] poemRow=poemUtil.getPoemText().split("\\|");
			poemUtil.setPoemRow(poemRow);
		}
		return poemUtils;
	}


	@Override
	public ArrayList<Poem> getCreationsByUId(Integer uid) {
		if(uid==null){
			return null;
		}
		int begin=0;
		int length=PageUtil.CREATIONPERPAGE;
		return poemDao.getCreationsByUId(uid,begin,length);
	}


	@Override
	public int getPoemNumberByUId(Integer uid) {
		return poemDao.getPoemNumberByUId(uid);
	}


	@Override
	public ArrayList<Poem> getPoemListByPage(String page, Integer uid) {
		int pageInt=0;
		if(page==null || "".equals(page.trim())){
			pageInt=1;
		}else{
			pageInt=Integer.parseInt(page);
		}
		if(pageInt<1){
			return null;
		}
		int begin=PageUtil.CREATIONPERPAGE*(pageInt-1);
		return poemDao.getCreationsByUId(uid,begin,PageUtil.CREATIONPERPAGE);
	}


	@Override
	public boolean removePoem(String poemId, String userId) {
		if(poemId==null || userId==null){
			return false;
		}
		Integer pid=Integer.parseInt(poemId);
		Integer uid=Integer.parseInt(userId);
		if(poemDao.removePoem(pid,uid)>0){
			return true;
		}
		return false;
	}


	@Override
	public ArrayList<HomePoemUtil> getHomePoemUtils() {
		return poemDao.getHomePoemUtils();
	}


	@Override
	public ArrayList<HomeOtherPoemUtil> getHomeOtherPoemUtils() {
		return poemDao.getHomeOtherPoemUtils();
	}


	@Override
	public ArrayList<PoemUtil> getPoemUtilsByLID(Integer userId,Integer lid) {
		ArrayList<PoemUtil> poemUtils=poemDao.getPoemUtilsByLId(lid);
		if(userId==null){
			for(PoemUtil poemUtil:poemUtils){
					poemUtil.setIsCollected(false);
					poemUtil.setIsSupported(false);
			}
		}else{
			for(PoemUtil poemUtil:poemUtils){
				if(collectionService.isCollectionExisted(userId,poemUtil.getPoemId())){
					poemUtil.setIsCollected(true);
				}else{
					poemUtil.setIsCollected(false);
				}
				if(supportService.isSupportExisted(userId,poemUtil.getPoemId())){
					poemUtil.setIsSupported(true);
				}else{
					poemUtil.setIsSupported(false);
				}
			}
		}
		for(PoemUtil poemUtil:poemUtils){
			System.out.println(poemUtil);
			String[] poemRow=poemUtil.getPoemText().split("\\|");
			poemUtil.setPoemRow(poemRow);
		}
		return poemUtils;
	}


	@Override
	public int getOtherPoemNumber() {
		return poemDao.getOtherPoemNumber();
	}


	@Override
	public ArrayList<OtherPoem> getOtherPoemListByPage(Integer page) {
		int begin=PageUtil.OTHERPOEMPERPAGE*(page-1);
		ArrayList<OtherPoem> otherPoems=poemDao.getOtherPoemListByPage(begin,PageUtil.OTHERPOEMPERPAGE);
		for(OtherPoem poem:otherPoems){
			String text=poem.getPoemText();
			poem.setPoemText(text.replaceAll("\\|", ""));
		}
		return otherPoems;
	}


	@Override
	public OtherPoem getOtherPoemById(Integer oid) {
		return poemDao.getOtherPoemById(oid);
	}


	@Override
	public OtherPoem getPrevOtherPoemById(Integer oid) {
		return poemDao.getPrevOtherPoemById(oid);
	}


	@Override
	public OtherPoem getNextOtherPoemById(Integer oid) {
		return poemDao.getNextOtherPoemById(oid);
	}


	@Override
	public ArrayList<PoemUtil> getPoemListByKey(String key) {
		ArrayList<PoemUtil> poemList=poemDao.getPoemListByKey(key);
		for(PoemUtil poem:poemList){
			String text=poem.getPoemText();
			poem.setPoemText(text.replaceAll("\\|", ""));
		}
		return poemList;
	}

}
