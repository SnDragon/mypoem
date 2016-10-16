package com.crm.util;

public class CollectionUtil {
	private Integer poemId;
	private Integer userId;
	private String userName;
	private String poemTitle;
	private String poemText;
	private String poemImg;
	
	
	
	@Override
	public String toString() {
		return "CollectionUtil [poemId=" + poemId + ", userId=" + userId + ", userName=" + userName + ", poemTitle="
				+ poemTitle + ", poemText=" + poemText + ", poemImg=" + poemImg + "]";
	}
	
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
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
	public String getPoemTitle() {
		return poemTitle;
	}
	public void setPoemTitle(String poemTitle) {
		this.poemTitle = poemTitle;
	}
	public String getPoemText() {
		return poemText;
	}
	public void setPoemText(String poemText) {
		this.poemText = poemText;
	}
	public String getPoemImg() {
		return poemImg;
	}
	public void setPoemImg(String poemImg) {
		this.poemImg = poemImg;
	}
	
	
}
