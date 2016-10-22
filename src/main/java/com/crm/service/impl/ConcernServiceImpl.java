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

	@Override
	public User getConcernUserByPageNum(String page, String concernerId) {
		Integer pageNum=Integer.parseInt(page);
		Integer userId=Integer.parseInt(concernerId);
		
		return concernDao.getConcernUserByPageNum(userId,pageNum*PageUtil.CONCERNSPERPAGE-1);
	}

	@Override
	public Integer isCocernedByUUId(Integer concernerId, Integer concernedId) {
		if(concernDao.getConcernByUUId(concernerId,concernedId)>0){
			return new Integer(1);
		}else{
			return null;
		}
	}

	@Override
	public boolean addConcern(Concern concern) {
		if(concernDao.addConcern(concern)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public ArrayList<User> getFansByUId(Integer uid) {
		if(uid==null){
			return null;
		}else{
			return concernDao.getFansByUId(uid);
		}
	}

	@Override
	public ArrayList<User> getConcernsById(Integer uid) {
		if(uid==null){
			return null;
		}else{
			return concernDao.getConcernsById(uid);
		}
	}

	

	


}
