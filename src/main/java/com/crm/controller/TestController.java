package com.crm.controller;


import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crm.model.User;

@RestController
@RequestMapping(value="/test")
public class TestController {
	
	@RequestMapping(value="/hello",produces="application/json;charset=UTF-8")
	public String hello(){
		return "你好!";
	}
	
	@RequestMapping(value="/say/{msg}",produces="application/json;charset=UTF-8")
	public String msg(@PathVariable (value="msg") String msg){
		return "{\"msg\":\"you say "+msg+"\"}";
	}
	
	@RequestMapping(value="/user/{id}")
	public User getUser(@PathVariable("id")Integer id){
		User user=new User();
		user.setUserId(id);
		user.setUserName("dragon");
		user.setUserSex(0);
		return user;
	}
	
//	@ResponseBody
//	@RequestMapping(value="/json")
//	public ModelAndView getJson(){
//		ModelAndView modelAndView=new ModelAndView();
//		String name="dragon";
//		modelAndView.addObject("name",name);
//		return modelAndView;
//	}
}
