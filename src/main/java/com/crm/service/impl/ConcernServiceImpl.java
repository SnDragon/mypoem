package com.crm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ConcernDao;
import com.crm.model.Concern;
import com.crm.model.User;
import com.crm.service.ConcernService;
import com.crm.util.PageUtil;
@Service("concernService")
public class ConcernServiceImpl implements ConcernService{
	@Resource
	private ConcernDao concernDao;
	
	@Override
	public int getConcernNumberById(Integer userId) {
		return concernDao.getConcernNumberById(userId);
	}

	@Override
	public int getConcernedNumberById(Integer userId) {
		return concernDao.getConcernedNumberById(userId);
	}

	@Override
	public boolean removeConcern(Concern concern) {
		if(concernDao.removeConcern(concern)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public ArrayList<User> getConcernUserByPage(String page, String uId) {
		if(uId==null){
			return null;
		}
		int pageInt=1;
		if(page!=null){
			pageInt=Integer.parseInt(page);
		}
		int userId=Integer.parseInt(uId);
		int begin=(pageInt-1)*PageUtil.CONCERNSPERPAGE;
		return concernDao.getConcernUserByPage(userId,begin, PageUtil.CONCERNSPERPAGE);
	}

	@Override
	public ArrayList<User> getFansByPage(String page, String uId) {
		if(uId==null){
			return null;
		}
		int pageInt=1;
		if(page!=null){
			pageInt=Integer.parseInt(page);
		}
		int userId=Integer.parseInt(uId);
		int begin=(pageInt-1)*PageUtil.CONCERNSPERPAGE;
		return concernDao.getFansByPage(userId,begin, PageUtil.CONCERNSPERPAGE);
	}

	


}
