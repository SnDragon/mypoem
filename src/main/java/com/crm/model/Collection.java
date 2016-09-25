package com.crm.model;

public class Collection {
	private Integer userId;
	private Integer poemId;
	
	@Override
	public String toString() {
		return "Collection [userId=" + userId + ", poemId=" + poemId + "]";
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
