package com.crm.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Poem;
import com.crm.model.User;
import com.crm.service.PoemService;


@Controller
public class IndexController {
	@Resource
	private PoemService poemService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String Index(HttpSession session){
		System.out.println("index");
		User user=new User();
		user.setUserId(1);
		user.setUserName("小吴");
		session.setAttribute("user", user);
		return "index";
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping(value="/poem")
	public ModelAndView poem(){
		ModelAndView modelAndView=new ModelAndView("showPoem");
		Poem poem=poemService.getPoemById(2);
		modelAndView.addObject("poem",poem);
		String[] content=poem.getPoemText().split("\\|");
		modelAndView.addObject("content",content);
		return modelAndView;
	}
	
	
}
