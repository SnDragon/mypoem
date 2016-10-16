package com.crm.controller;


import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Concern;
import com.crm.model.User;
import com.crm.service.ConcernService;

@Controller
@RequestMapping(value="/concern")
public class ConcernController {
	@Resource
	private ConcernService concernService;
	
	@RequestMapping(value="/removeConcern")
	@ResponseBody
	public User removeConcern(HttpServletRequest request){
		String concernedId=request.getParameter("concernedId");
		String concernerId=request.getParameter("concernerId");
		String page=request.getParameter("page");
		Concern concern=new Concern(Integer.parseInt(concernedId),Integer.parseInt(concernerId));
		if(concernService.removeConcern(concern)){
			return concernService.getConcernUserByPageNum(page,concernerId);
		}else{
			return null;
		}
	}
	
	@RequestMapping(value="/getConcernsByPage")
	@ResponseBody
	public ArrayList<User> getConcernsByPage(HttpServletRequest request){
		String page=request.getParameter("page");
		String uId=request.getParameter("uId");
		ArrayList<User> userList=concernService.getConcernUserByPage(page,uId);
		return userList;
	}
	
	@RequestMapping(value="/getFansByPage")
	@ResponseBody
	public ArrayList<User> getFansByPage(HttpServletRequest request){
		String page=request.getParameter("page");
		String uId=request.getParameter("uId");
		ArrayList<User> userList=concernService.getFansByPage(page,uId);
		return userList;
	}
}
