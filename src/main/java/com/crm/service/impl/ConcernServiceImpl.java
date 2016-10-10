package com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ConcernDao;
import com.crm.service.ConcernService;
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

}
