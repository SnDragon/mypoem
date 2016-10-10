package com.crm.util;

public class UserUtil {
	private Integer userId;
	private String userName;
	private String userMotto;
	private String userIcon;
	private String userIntro;
	private Integer userSex;
	private Integer numOfConcern;//他关注的人
	private Integer numOfConcerned;//关注他的人
	private Integer numOfCollection;//他的收藏
	
	
	@Override
	public String toString() {
		return "UserUtil [userId=" + userId + ", userName=" + userName + ", userMotto=" + userMotto + ", userIcon="
				+ userIcon + ", userIntro=" + userIntro + ", userSex=" + userSex + ", numOfConcern=" + numOfConcern
				+ ", numOfConcerned=" + numOfConcerned + ", numOfCollection=" + numOfCollection + "]";
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
	public Integer getNumOfConcern() {
		return numOfConcern;
	}
	public void setNumOfConcern(Integer numOfConcern) {
		this.numOfConcern = numOfConcern;
	}
	public Integer getNumOfConcerned() {
		return numOfConcerned;
	}
	public void setNumOfConcerned(Integer numOfConcerned) {
		this.numOfConcerned = numOfConcerned;
	}
	public Integer getNumOfCollection() {
		return numOfCollection;
	}
	public void setNumOfCollection(Integer numOfCollection) {
		this.numOfCollection = numOfCollection;
	}
	
	
}
