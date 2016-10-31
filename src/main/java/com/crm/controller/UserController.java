package com.crm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.beans.factory.support.MethodOverrides;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Poem;
import com.crm.model.User;
import com.crm.service.CollectionService;
import com.crm.service.ConcernService;
import com.crm.service.PoemService;
import com.crm.service.TransmitService;
import com.crm.service.UserService;
import com.crm.util.CollectionUtil;
import com.crm.util.Encryption;
import com.crm.util.PoemUtil;
import com.crm.util.TransmitUtil;
import com.crm.util.UserUtil;
import com.sun.javafx.sg.prism.NGShape.Mode;
import com.sun.org.apache.xpath.internal.operations.Mod;



@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource 
	private PoemService poemService;
	@Resource
	private ConcernService concernService;
	@Resource
	private CollectionService collectionService;
	@Resource
	private TransmitService transmitService;
	
	@RequestMapping(value="/doLogin",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		User user=userService.checkLogin(email, password);
		if(user!=null){
			session.setAttribute("user", user);
			final int EXPIRE_TIME=60*60*24*7;//cookie过期时间7天
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
			return new ModelAndView("redirect:/");
		}else{
//			ModelAndView modelAndView=new ModelAndView("redirect:/login");
//			modelAndView.addObject("message","该邮箱未注册或密码错误");
			return new ModelAndView("redirect:/login?fail=true");
//			return modelAndView;
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
			modelAndView.setViewName("redirect:/register?fail=true");
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
			return new ModelAndView("redirct:/");
		}
		System.out.println("userId:"+user.getUserId());
		ModelAndView modelAndView=new ModelAndView("friendCircle");
		ArrayList<PoemUtil> poemUtils=poemService.getPoemAndTransmitUtilsByUID(user.getUserId());
		modelAndView.addObject("poemUtilList",poemUtils);
		return modelAndView;
	}
	
	@RequestMapping(value="/getPoemAndTransmitUtilsByAjax",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<PoemUtil> getPoemAndTransmitUtilsByAjax(HttpServletRequest request){
		String userId=request.getParameter("uid");
		String page=request.getParameter("page");
		return poemService.getPoemAndTransmitUtilsByPage(userId,page);
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
	
	@RequestMapping(value="/uid/{uid}",method=RequestMethod.GET)
	public ModelAndView showUser(@PathVariable("uid") Integer uid){
		ModelAndView modelAndView=new ModelAndView("showUser");
		return modelAndView;
	}
	
	@RequestMapping(value="/aid/{aid}",method=RequestMethod.GET)
	public ModelAndView showAuthor(@PathVariable("aid") Integer aid,HttpSession session){
		User user=(User)session.getAttribute("user");
		ModelAndView modelAndView=new ModelAndView("showAuthor");
		UserUtil author=userService.getUserUtilById(aid);
		System.out.println(author);
		Integer isConcerned=null;
		if(user!=null){
			isConcerned=concernService.isCocernedByUUId(user.getUserId(),author.getUserId());
		}
		
		ArrayList<PoemUtil> poemUtils=poemService.getPoemUtilsByUUID(user!=null?user.getUserId():null,aid);
		modelAndView.addObject("author",author);
		modelAndView.addObject("isConcerned",isConcerned);
		modelAndView.addObject("poemUtilList",poemUtils);
		for(PoemUtil poemUtil:poemUtils){
			System.out.println(poemUtil);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/changeIcon/{uid}",method=RequestMethod.POST)
	public ModelAndView updateIcon(@PathVariable("uid") Integer uid,@RequestParam("file") MultipartFile file,HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		boolean success=true;
		String iconName="user"+uid+".";
//		String path="D:\\javaEEd1\\mypoem\\src\\main\\webapp\\img\\user";
		String contextPath=session.getServletContext().getRealPath("/img/user");
		System.out.println("contextPath:"+contextPath);
		if(!file.isEmpty()){  
            String contentType=file.getContentType();  
            //获得文件后缀名称  
            System.out.println(contentType);
            iconName+=contentType.substring(contentType.indexOf("/")+1);  
            String type=contentType.substring(0,contentType.indexOf("/"));
            System.out.println("type:"+type);
            if("image".equals(type)){
            	 try {
//					file.transferTo(new File(path+"/"+iconName));
            		 file.transferTo(new File(contextPath+"/"+iconName));
				} catch (IOException e) {
					e.printStackTrace();
				} 
            }else{
            	success=false;
            }
        }else{
        	success=false;
        }
		if(success && userService.updateUserIcon(uid,iconName)){
//			String introduction="hello world";
//			userService.updateIconAndIntro(iconName,introduction);
			User user=(User)session.getAttribute("user");
			user.setUserIcon(iconName);
			session.setAttribute("user", user);
			modelAndView.setViewName("showUser");
		}else{
			modelAndView.setViewName("fail");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/updateUserIntro/{uid}",method=RequestMethod.POST)
	@ResponseBody
	public String updateUserIntro(@PathVariable("uid") Integer uid,HttpServletRequest request){
		String user_intro=request.getParameter("user_intro");
		if(userService.updateUserIntro(uid,user_intro)){
			User user=(User)request.getSession().getAttribute("user");
			user.setUserIntro(user_intro);
			request.getSession().setAttribute("user", user);
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/updateUser/{uid}",method=RequestMethod.POST)
	@ResponseBody
	public String updateUser(@PathVariable("uid") Integer uid,HttpServletRequest request){
		String type=request.getParameter("type");
		String data=request.getParameter("data");
		String result="";
		if(type==null){
			result="fail";
		}else if("sex".equals(type)){
			if(userService.updateUserSex(uid,data)){
				result="success";
				User user=(User)request.getSession().getAttribute("user");
				if("female".equals(data)){
					user.setUserSex(0);
				}else{
					user.setUserSex(1);
				}
				request.getSession().setAttribute("user", user);
			}
		}
		return result;
	}
	
	@RequestMapping(value="/updateUserMotto/{uid}",method=RequestMethod.POST)
	@ResponseBody
	public String updateUserMotto(@PathVariable("uid") Integer uid,HttpServletRequest request){
		String user_intro=request.getParameter("user_intro");
		if(userService.updateUserMotto(uid,user_intro)){
			User user=(User)request.getSession().getAttribute("user");
			user.setUserMotto(user_intro);
			request.getSession().setAttribute("user", user);
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/security/{uid}",method=RequestMethod.GET)
	public ModelAndView showSecurity(@PathVariable("uid")Integer uid){
		return new ModelAndView("security");
	}
	
	@RequestMapping(value="/updatePass/{uid}",method=RequestMethod.POST)
	@ResponseBody
	public String updatePass(@PathVariable("uid") Integer uid,HttpServletRequest request,HttpSession session){
		User user=(User)session.getAttribute("user");
		String oldPass=request.getParameter("oldPass");
		String newPass=request.getParameter("newPass");
		String againPass=request.getParameter("againPass");
		System.out.println(user.getUserPassword()==null);
		if(!Encryption.md5(oldPass).equals(user.getUserPassword())){
			return "wrong";
		}
		if(userService.updateUserPass(uid,oldPass,newPass,againPass)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/concern/{uid}",method=RequestMethod.GET)
	public ModelAndView showConcern(@PathVariable("uid") Integer uid){
		ModelAndView modelAndView = new ModelAndView("showConcern");
		ArrayList<User> concernUserList=userService.getConcernUserListById(uid);
		modelAndView.addObject("cocernUserList",concernUserList);
		for(User user:concernUserList){
			System.out.println(user);
		}
		int number=concernService.getConcernNumberById(uid);
		modelAndView.addObject("number",number);
		return modelAndView;
	}
	
	@RequestMapping(value="/fans/{uid}",method=RequestMethod.GET)
	public ModelAndView showFans(@PathVariable("uid") Integer uid){
		ModelAndView modelAndView=new ModelAndView("showFans");
		int number=concernService.getConcernedNumberById(uid);
		modelAndView.addObject("number",number);
		ArrayList<User>  fansList=userService.getFansListById(uid);
		modelAndView.addObject("fansList",fansList);
		for(User user:fansList){
			System.out.println(user);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/collection/{uid}",method=RequestMethod.GET)
	public ModelAndView showCollection(@PathVariable("uid") Integer uid){
		ModelAndView modelAndView=new ModelAndView("showCollection");
		int number=collectionService.getCollectionNumberById(uid);
		modelAndView.addObject("number",number);
		ArrayList<CollectionUtil> collectionList=collectionService.getCollectionsByPage(null,uid);
		modelAndView.addObject("collectionList",collectionList);
		for(CollectionUtil collectionUtil:collectionList){
			System.out.println(collectionUtil);
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/creation/{uid}",method=RequestMethod.GET)
	public ModelAndView showCreations(@PathVariable("uid") Integer uid,HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView("showCreation");
		int number=poemService.getPoemNumberByUId(uid);
		modelAndView.addObject("number",number);
		String page=request.getParameter("page");
		ArrayList<Poem> creationList=poemService.getPoemListByPage(page,uid);
		modelAndView.addObject("creationList",creationList);
		for(Poem poem:creationList){
			System.out.println(poem);
		}
//		String[] poemRow=poemUtil.getPoemText().split("\\|");
		return modelAndView;
	}
	
	@RequestMapping(value="/transmition/{uid}",method=RequestMethod.GET)
	public ModelAndView showTransmition(@PathVariable("uid") Integer uid,HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView("showTransmition");
		int number=transmitService.getTransmitionNumberByUId(uid);
		modelAndView.addObject("number",number);
		String page=request.getParameter("page");
		ArrayList<TransmitUtil> transmitList=transmitService.getTransmitsByPage(page,uid);
		modelAndView.addObject("transmitList",transmitList);
		return modelAndView;
	}
	
}
