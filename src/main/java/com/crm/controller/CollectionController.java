package com.crm.controller;


import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Collection;
import com.crm.service.CollectionService;
import com.crm.util.CollectionUtil;

@Controller
@RequestMapping(value="/collection")
public class CollectionController {
	@Resource
	private CollectionService collectionService;
		
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addCollection(@RequestBody Collection collection){
		System.out.println(collection);
		if(collectionService.addCollection(collection)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	@ResponseBody 
	public String removeCollection(@RequestBody Collection collection){
		System.out.println(collection);
		if(collectionService.removeCollection(collection)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/getCollectionsByPage",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<CollectionUtil> getCollectionsByPage(HttpServletRequest request){
		String page=request.getParameter("page");
		String uid=request.getParameter("uId");
		return collectionService.getCollectionsByPage(page, Integer.parseInt(uid));
	}
	
	@RequestMapping(value="/removeByAjax",method=RequestMethod.POST)
	@ResponseBody
	public CollectionUtil removeByAjax(HttpServletRequest request){
		String poemId=request.getParameter("poemId");
		String userId=request.getParameter("userId");
		String page=request.getParameter("page");
		Collection collection=new Collection(Integer.parseInt(userId),Integer.parseInt(poemId));
		if(collectionService.removeCollection(collection)){
			return collectionService.getCollectionByPageNum(page,userId);
		}else{
			return null;
		}
	}
	
}
