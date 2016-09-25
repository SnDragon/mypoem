package com.crm.service;

import com.crm.model.*;


public interface UserService {
	
   public User checkLogin(String email,String password);

   public boolean register(String username, String email, String password1, String password2);

   public boolean isAccountExisted(String email);
}
