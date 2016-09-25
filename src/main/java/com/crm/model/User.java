package com.crm.model;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userId;
	private String userName;
	private String userMotto;
	private String userIcon;
	private String userEmail;
	private String userPassword;
	private String userIntro;
	private Integer userSex;
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userMotto=" + userMotto + ", userIcon="
				+ userIcon + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userIntro=" + userIntro
				+ ", userSex=" + userSex + "]";
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMotto() {
		return userMotto;
	}
	public void setUserMotto(String userMotto) {
		this.userMotto = userMotto;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserIntro() {
		return userIntro;
	}
	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}
	public Integer getUserSex() {
		return userSex;
	}
	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}
	
}
