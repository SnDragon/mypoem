package com.crm.util;

public class HomeUserUtil {
	private Integer userId;
	private Integer numOfPoem;
	private Integer numOfConcern;
	private String userName;
	private String userIcon;
	@Override
	public String toString() {
		return "HomeUserUtil [userId=" + userId + ", numOfPoem=" + numOfPoem + ", numOfConcern=" + numOfConcern
				+ ", userName=" + userName + ", userIcon=" + userIcon + "]";
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getNumOfPoem() {
		return numOfPoem;
	}
	public void setNumOfPoem(Integer numOfPoem) {
		this.numOfPoem = numOfPoem;
	}
	public Integer getNumOfConcern() {
		return numOfConcern;
	}
	public void setNumOfConcern(Integer numOfConcern) {
		this.numOfConcern = numOfConcern;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserIcon() {
		return userIcon;
	}
	public void setUserIcon(String userIcon) {
		this.userIcon = userIcon;
	}
	
}
