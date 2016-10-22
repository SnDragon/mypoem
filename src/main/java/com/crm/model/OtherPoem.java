package com.crm.model;

public class OtherPoem {
	private Integer poemId;
	private String authorName;
	private String poemTitle;
	private String poemText;
	private String publishTime;
	@Override
	public String toString() {
		return "OtherPoem [poemId=" + poemId + ", authorName=" + authorName + ", poemTitle=" + poemTitle + ", poemText="
				+ poemText + ", publishTime=" + publishTime + "]";
	}
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
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
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	
	
}
