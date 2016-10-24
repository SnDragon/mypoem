package com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.LabelDao;
import com.crm.model.Label;
import com.crm.service.LabelService;

@Service("labelService")
public class LabelServiceImpl implements LabelService{
	@Resource
	private LabelDao labelDao;
	
	@Override
	public Label getLabelById(Integer lid) {
		return labelDao.getLabelById(lid);
	}

}
