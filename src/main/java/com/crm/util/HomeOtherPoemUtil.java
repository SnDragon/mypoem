package com.crm.util;

public class HomeOtherPoemUtil {
	private Integer poemId;
	private String poemTitle;
	private String authorName;
	@Override
	public String toString() {
		return "HomeOtherPoemUtil [poemId=" + poemId + ", poemTitle=" + poemTitle + ", authorName=" + authorName + "]";
	}
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
	}
	public String getPoemTitle() {
		return poemTitle;
	}
	public void setPoemTitle(String poemTitle) {
		this.poemTitle = poemTitle;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	
	
}
