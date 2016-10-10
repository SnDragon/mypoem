package com.crm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.ConcernDao;
import com.crm.dao.UserDao;
import com.crm.model.User;
import com.crm.service.ConcernService;
import com.crm.service.UserService;
import com.crm.util.Encryption;
import com.crm.util.UserUtil;
@Service("userService")
public class UserServiceImpl implements UserService {
     @Resource
	private UserDao userDao;
     @Resource
     private ConcernService concernService;

   /**
    * 登陆验证
    * @param
    */
	public User checkLogin(String email, String password) {
		if(email==null || password==null || "".equals(email) || "".equals(password)){
			return null;
		}
		User user=userDao.getUserByEmail(email);
		System.out.println(user);
		System.out.println(user.getUserPassword());
		System.out.println(Encryption.md5(password));
		if(user!=null&&user.getUserPassword().equals(Encryption.md5(password))){
			return user;
		}
		return null;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public boolean register(String username, String email, String password1, String password2) {
		if(username==null || email==null || password1==null || password2==null){
			return false;
		}
		if("".equals(username) || "".equals(email) || "".equals(password1) || "".equals("password2")){
			return false;
		}
		if(!password1.equals(password2)){
			return false;
		}
		User user=new User();
		user.setUserName(username);
		user.setUserEmail(email);
		user.setUserPassword(Encryption.md5(password1));
		if(userDao.insertUser(user)>0){
			return true;
		}else{
			return false;
		}
		
	}

	@Override
	public boolean isAccountExisted(String email) {
		if(userDao.getUserByEmail(email)!=null){
			return true;
		}
		return false;
	}

	@Override
	public boolean updateUserIcon(Integer uid,String iconName) {
		if(userDao.updateUserIcon(uid,iconName)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateUserIntro(Integer uid, String user_intro) {
		if(userDao.updateUserIntro(uid, user_intro)>0){
			return true;
		}else{
			return false;
		}
	}
	
	@Override
	public boolean updateUserMotto(Integer uid, String user_intro) {
		if(userDao.updateUserMotto(uid, user_intro)>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean updateUserPass(Integer uid, String oldPass, String newPass, String againPass) {
		if(!newPass.equals(againPass)){
			return false;
		}
		newPass=Encryption.md5(newPass);
		if(userDao.updateUserPass(uid,newPass)>0){
			return true;
		}
		return false;
	}

	@Override
	public UserUtil getUserUtilById(Integer aid) {
		if(aid==null){
			return null;
		}
		UserUtil userUtil=userDao.getUserUtilById(aid);
		int numOfConcern=concernService.getConcernNumberById(aid);
		int numOfConcerned=concernService.getConcernedNumberById(aid);
		userUtil.setNumOfConcern(numOfConcern);
		userUtil.setNumOfConcerned(numOfConcerned);
		return userUtil;
	}

}
