package com.crm.dao;

import com.crm.model.*;
import com.crm.util.UserUtil;

public interface UserDao {
	public User findUserByName(String username);

	public int insertUser(User user);

	public User getUserByEmail(String email);

	public int updateUserIcon(Integer uid,String iconName);

	public int updateUserIntro(Integer uid, String user_intro);

	public int updateUserMotto(Integer uid, String user_intro);

	public int updateUserPass(Integer uid, String newPass);

	public UserUtil getUserUtilById(Integer aid);
}
