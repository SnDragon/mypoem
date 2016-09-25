package com.crm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Support;
import com.crm.service.SupportService;

@Controller
@RequestMapping(value="/support")
public class SupportController {
	@Resource
	private SupportService supportService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addSupport(@RequestBody Support support){
		System.out.println(support);
		if(supportService.addSupport(support)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	@ResponseBody
	public String removeSupport(@RequestBody Support support){
		System.out.println(support);
		if(supportService.removeSupport(support)){
			return "success";
		}else{
			return "fail";
		}
	}
}
