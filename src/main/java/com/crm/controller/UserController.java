package com.crm.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.User;
import com.crm.service.PoemService;
import com.crm.service.UserService;
import com.crm.util.PoemUtil;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource PoemService poemService;
	
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		User user=userService.checkLogin(email, password);
		if(user!=null){
			session.setAttribute("user", user);
			final int EXPIRE_TIME=60*60*24*7;//cookie过期时间
			Cookie accountCookie=new Cookie("email", email);
			accountCookie.setMaxAge(EXPIRE_TIME);
			Cookie rememberPassCookie=null;
			Cookie passCookie=null;
			
			String rememberPass=request.getParameter("rememberPass");
			//如果用户选择记住密码，则使用cookie保留密码7天，否则清除cookie
			if(rememberPass!=null){
				rememberPassCookie =new Cookie("rememberPass", "true");
				passCookie=new Cookie("password", password);
				//设置cookie的过期时间，单位为秒
				rememberPassCookie.setMaxAge(EXPIRE_TIME);
				passCookie.setMaxAge(EXPIRE_TIME);
				
			}else{
				rememberPassCookie=new Cookie("rememberPass", null);
				passCookie=new Cookie("password", null);
				rememberPassCookie.setMaxAge(0);
				passCookie.setMaxAge(0);
			}
			/*不设置路径的话默认为当前路径，对于Servlet来说
			*为request.getContextPath() + web.xml里配置的该Servlet的url-pattern路径部分) 
			*此处应为/mypoem/user/,因此/mypoem/下的login不能访问到该cookie
			*/
			//String path=request.getContextPath();//mypoem/user
			//System.out.println(path);
			//或者将/login改成/user/login
			rememberPassCookie.setPath("/");
			accountCookie.setPath("/");
			passCookie.setPath("/");
			
			response.addCookie(rememberPassCookie);
			response.addCookie(accountCookie);
			response.addCookie(passCookie);
			return new ModelAndView("redirect:/index");
		}else{
			return new ModelAndView("fail");
		}
	}
	
	@RequestMapping(value="/doRegister",method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView();
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String password1=request.getParameter("password1");
		String password2=request.getParameter("password2");
		if(userService.register(username,email,password1,password2)){
			modelAndView.setViewName("redirect:/login");
		}else{
			modelAndView.setViewName("fail");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpSession session){
		session.invalidate();
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value="/friendCircle",method=RequestMethod.GET)
	public ModelAndView showFriendCircle(HttpSession session){
		User user=(User)session.getAttribute("user");
		if(user==null){
			return null;
		}
		ModelAndView modelAndView=new ModelAndView("friendCircle");
		ArrayList<PoemUtil> poemUtils=poemService.getPoemUtilsByUID(user.getUserId());
		modelAndView.addObject("poemUtilList",poemUtils);
		for(PoemUtil poemUtil:poemUtils){
			System.out.println(poemUtil);
			String[] poemRow=poemUtil.getPoemText().split("\\|");
			poemUtil.setPoemRow(poemRow);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/isAccountExisted",method=RequestMethod.POST)
	public @ResponseBody String isAccountExisted(String email){
		System.out.println(email);
		if(email==null || "".equals(email)){
			return "false";
		}
		if(userService.isAccountExisted(email)){
			return "true";
		}
		return "false";
	}
}
