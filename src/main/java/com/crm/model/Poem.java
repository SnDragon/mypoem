package com.crm.model;

import java.sql.Timestamp;

public class Poem {
	private Integer poemId;
	private Integer userId;
	private String poemText;
	private String poemTitle;
	private Integer poemNumSupport;
	private Timestamp poemPublishTime;
	private String poemImg;
	
	@Override
	public String toString() {
		return "Poem [poemId=" + poemId + ", userId=" + userId + ", poemText=" + poemText + ", poemTitle=" + poemTitle
				+ ", poemNumSupport=" + poemNumSupport + ", poemPublishTime=" + poemPublishTime + ", poemImg=" + poemImg
				+ "]";
	}
	
	public String getPoemImg() {
		return poemImg;
	}
	public void setPoemImg(String poemImg) {
		this.poemImg = poemImg;
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
	public String getPoemText() {
		return poemText;
	}
	public void setPoemText(String poemText) {
		this.poemText = poemText;
	}
	public String getPoemTitle() {
		return poemTitle;
	}
	public void setPoemTitle(String poemTitle) {
		this.poemTitle = poemTitle;
	}
	public Integer getPoemNumSupport() {
		return poemNumSupport;
	}
	public void setPoemNumSupport(Integer poemNumSupport) {
		this.poemNumSupport = poemNumSupport;
	}
	public Timestamp getPoemPublishTime() {
		return poemPublishTime;
	}
	public void setPoemPublishTime(Timestamp poemPublishTime) {
		this.poemPublishTime = poemPublishTime;
	}
	
	
}
