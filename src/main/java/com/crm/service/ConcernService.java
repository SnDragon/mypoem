package com.crm.service;


public interface ConcernService {
	//获取userId关注的人的数目
	public int getConcernNumberById(Integer userId);
	//获取关注userId的人的数目
	public int getConcernedNumberById(Integer userId);
}
