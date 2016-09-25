package com.crm.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Collection;
import com.crm.service.CollectionService;

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
	
	@RequestMapping(value="remove",method=RequestMethod.POST)
	@ResponseBody 
	public String removeCollection(@RequestBody Collection collection){
		System.out.println(collection);
		if(collectionService.removeCollection(collection)){
			return "success";
		}else{
			return "fail";
		}
	}
}
