package com.crm.service;

import java.util.ArrayList;

import com.crm.model.*;
import com.crm.util.HomeUserUtil;
import com.crm.util.UserUtil;


public interface UserService {
	
   public User checkLogin(String email,String password);

   public boolean register(String username, String email, String password1, String password2);

   public boolean isAccountExisted(String email);

   public boolean updateUserIcon(Integer uid,String iconName);
	
	public boolean updateUserIntro(Integer uid, String user_intro);
	
	public boolean updateUserMotto(Integer uid, String user_intro);
	
	public boolean updateUserPass(Integer uid, String oldPass, String newPass, String againPass);
	
	public UserUtil getUserUtilById(Integer aid);

	public boolean updateUserSex(Integer uid,String sex);

	public ArrayList<User> getConcernUserListById(Integer uid);

	public ArrayList<User> getFansListById(Integer uid);

	public ArrayList<HomeUserUtil> getRecommendUsers();
}
