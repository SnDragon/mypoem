package com.crm.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Poem;
import com.crm.model.User;
import com.crm.service.PoemService;
import com.crm.service.UserService;
import com.crm.util.PoemUtil;
import com.crm.util.HomeOtherPoemUtil;
import com.crm.util.HomePoemUtil;
import com.crm.util.HomeUserUtil;


@Controller
public class IndexController {
	@Resource
	private PoemService poemService;
	@Resource
	private UserService userService;
	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView Index(HttpSession session){
		User user=new User();
		user.setUserId(2);
		user.setUserName("dragon");
		user.setUserEmail("1803240383@qq.com");
		user.setUserIcon("user1.jpeg");
		user.setUserMotto("hello world");
		user.setUserPassword("e10adc3949ba59abbe56e057f20f883e");
		user.setUserSex(0);
		session.setAttribute("user", user);
		ModelAndView modelAndView=new ModelAndView("index");
		ArrayList<HomePoemUtil> homePoemUtils=poemService.getHomePoemUtils();
		modelAndView.addObject("homePoemUtils",homePoemUtils);
		ArrayList<HomeUserUtil> homeUserUtils=userService.getRecommendUsers();
		modelAndView.addObject("homeUserUtils",homeUserUtils);
		for(HomeUserUtil homeUserUtil:homeUserUtils){
			System.out.println(homeUserUtil);
		}
		ArrayList<HomeOtherPoemUtil> otherPoemUtils=poemService.getHomeOtherPoemUtils();
		modelAndView.addObject("otherPoemUtils",otherPoemUtils);
		for(HomeOtherPoemUtil poem:otherPoemUtils){
			System.out.println(poem);
		}
		return modelAndView;
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
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public ModelAndView showSearchResult(@RequestParam(value="q",required=true)String key){
		ModelAndView modelAndView=new ModelAndView("showSearch");
		if("".equals(key.trim())){
			return null;
		}
		ArrayList<User> userList=userService.getUserListByKey(key);
		for(User user:userList){
			System.out.println(user);
		}
		modelAndView.addObject("userList",userList);
		ArrayList<PoemUtil> poemList=poemService.getPoemListByKey(key);
		for(PoemUtil poem:poemList){
			System.out.println(poem);
		}
		modelAndView.addObject("poemList",poemList);
		modelAndView.addObject("key",key);
		return modelAndView;
	}
	
}
