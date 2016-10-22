package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Concern;
import com.crm.model.User;

public interface ConcernService {
	//获取userId关注的人的数目
	public int getConcernNumberById(Integer userId);
	//获取关注userId的人的数目
	public int getConcernedNumberById(Integer userId);
	public boolean removeConcern(Concern concern);
	public ArrayList<User> getConcernUserByPage(String page, String uId);
	public ArrayList<User> getFansByPage(String page, String uId);
	public User getConcernUserByPageNum(String page, String concernerId);
	public Integer isCocernedByUUId(Integer userId, Integer userId2);
	public boolean addConcern(Concern concern);
	public ArrayList<User> getFansByUId(Integer uid);
	public ArrayList<User> getConcernsById(Integer uid);
	
}
