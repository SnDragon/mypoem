package com.crm.util;

import java.sql.Timestamp;
import java.util.Arrays;


public class PoemUtil {
	private Integer poemId;
	private Integer userId;
	private String poemTitle;
	private String poemText;
	private String[] poemRow;
	private Boolean isCollected;
	private Boolean isSupported;
	private String userName;
	private String poemImg;
	private Integer poemNumSupport;
	private Integer poemNumComment;
	private Integer poemNumTransmit;
	
	
	@Override
	public String toString() {
		return "PoemUtil [poemId=" + poemId + ", userId=" + userId + ", poemTitle=" + poemTitle + ", poemText="
				+ poemText + ", poemRow=" + Arrays.toString(poemRow) + ", isCollected=" + isCollected + ", isSupported="
				+ isSupported + ", userName=" + userName + ", poemImg=" + poemImg + ", poemNumSupport=" + poemNumSupport
				+ ", poemNumComment=" + poemNumComment + ", poemNumTransmit=" + poemNumTransmit + ", poemPublishTime="
				+ poemPublishTime + "]";
	}

	public Integer getPoemNumComment() {
		return poemNumComment;
	}

	public void setPoemNumComment(Integer poemNumComment) {
		this.poemNumComment = poemNumComment;
	}

	public Integer getPoemNumTransmit() {
		return poemNumTransmit;
	}

	public void setPoemNumTransmit(Integer poemNumTransmit) {
		this.poemNumTransmit = poemNumTransmit;
	}
	private Timestamp poemPublishTime;
	


	public Boolean getIsSupported() {
		return isSupported;
	}

	public void setIsSupported(Boolean isSupported) {
		this.isSupported = isSupported;
	}

	public Boolean getIsCollected() {
		return isCollected;
	}

	public void setIsCollected(Boolean isCollected) {
		this.isCollected = isCollected;
	}

	public String[] getPoemRow() {
		return poemRow;
	}

	public void setPoemRow(String[] poemRow) {
		this.poemRow = poemRow;
	}
	
	
	public Integer getPoemNumSupport() {
		return poemNumSupport;
	}
	public void setPoemNumSupport(Integer poemNumSupport) {
		this.poemNumSupport = poemNumSupport;
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
	public String getPoemTitle() {
		return poemTitle;
	}
	public void setPoemTitle(String poemTitle) {
		this.poemTitle = poemTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPoemImg() {
		return poemImg;
	}
	public void setPoemImg(String poemImg) {
		this.poemImg = poemImg;
	}
	public Timestamp getPoemPublishTime() {
		return poemPublishTime;
	}
	public void setPoemPublishTime(Timestamp poemPublishTime) {
		this.poemPublishTime = poemPublishTime;
	}
	public String getPoemText() {
		return poemText;
	}
	public void setPoemText(String poemText) {
		this.poemText = poemText;
	}
}
