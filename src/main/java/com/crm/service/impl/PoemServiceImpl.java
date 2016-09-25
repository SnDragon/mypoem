package com.crm.service.impl;


import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.PoemDao;
import com.crm.model.Poem;
import com.crm.service.CollectionService;
import com.crm.service.PoemService;
import com.crm.service.SupportService;
import com.crm.util.PoemUtil;
@Service("poemService")
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
			if(collectionService.isCollectionExisted(poemUtil.getUserId(),poemUtil.getPoemId())){
				poemUtil.setIsCollected(true);
			}else{
				poemUtil.setIsCollected(false);
			}
			if(supportService.isSupportExisted(poemUtil.getUserId(),poemUtil.getPoemId())){
				poemUtil.setIsSupported(true);
			}else{
				poemUtil.setIsSupported(false);
			}
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

}
