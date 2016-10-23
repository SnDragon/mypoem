package com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.SupportDao;
import com.crm.model.Support;
import com.crm.service.PoemService;
import com.crm.service.SupportService;
@Service("supportService")
@Transactional(propagation=Propagation.REQUIRED)
public class SupportServiceImpl implements SupportService{
	@Resource
	private SupportDao supportDao;
	@Resource 
	private PoemService poemService;
	
	@Override
	public boolean isSupportExisted(Integer userId, Integer poemId) {
		if(supportDao.getSupportByUPId(userId,poemId)!=null){
			return true;
		}else{
			return false;
		}
	}
//此处应该使用事务
	@Override
	public boolean addSupport(Support support) {
		if(support==null || support.getPoemId()==null || support.getUserId()==null){
			return false;
		}
		if(supportDao.insertSupport(support)>0 && poemService.addSupport(support.getPoemId())){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean removeSupport(Support support) {
		if(support==null || support.getPoemId()==null || support.getUserId()==null){
			return false;
		}
		if(supportDao.removeSupport(support)>0 && poemService.subSupport(support.getPoemId())){
			return true;
		}else{
			return false;
		}
	}

}
