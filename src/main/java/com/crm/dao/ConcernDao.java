package com.crm.dao;

import org.springframework.stereotype.Service;

@Service("concernDao")
public interface ConcernDao {

	int getConcernNumberById(Integer userId);

	int getConcernedNumberById(Integer userId);

}
