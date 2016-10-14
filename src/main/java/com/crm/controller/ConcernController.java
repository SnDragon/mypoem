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
	public String removeConcern(@RequestBody Concern concern){
		if(concernService.removeConcern(concern)){
			return "success";
		}else{
			return "fail";
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
