package com.crm.model;


public class Support {
	private Integer userId;
	private Integer poemId;
	
	
	@Override
	public String toString() {
		return "Support [userId=" + userId + ", poemId=" + poemId + "]";
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
	}
	
}
