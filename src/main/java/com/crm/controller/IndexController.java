package com.crm.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Poem;
import com.crm.model.User;
import com.crm.service.PoemService;
import com.crm.util.PoemUtil;


@Controller
public class IndexController {
	@Resource
	private PoemService poemService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String Index(HttpSession session){
		User user=new User();
		user.setUserId(1);
		user.setUserName("小吴");
		user.setUserEmail("1803240383@qq.com");
		user.setUserIcon("user1.jpeg");
		user.setUserMotto("hello world");
		user.setUserPassword("e10adc3949ba59abbe56e057f20f883e");
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
	
	@RequestMapping(value="/recommend",method=RequestMethod.GET)
	public ModelAndView getRecommend(){
		ModelAndView modelAndView=new ModelAndView("recommend");
		ArrayList<PoemUtil> poemUtilList=poemService.getRecommendPoemUtils();
		modelAndView.addObject("poemUtilList",poemUtilList);
		return modelAndView;
	}
	
	
}
