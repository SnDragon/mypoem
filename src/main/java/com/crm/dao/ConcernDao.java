package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.Concern;
import com.crm.model.User;

public interface ConcernDao {

	int getConcernNumberById(Integer userId);

	int getConcernedNumberById(Integer userId);

	int removeConcern(Concern concern);

	ArrayList<User> getConcernUserByPage(int userId,int begin,int length);

	ArrayList<User> getFansByPage(int userId, int begin, int concernsperpage);

	User getConcernUserByPageNum(int userId,int order);

}
