package com.crm.util;


public class HomePoemUtil {
	private Integer poemId;
	private String poemTitle;
	private String poemImg;
	@Override
	public String toString() {
		return "HomePoemUtil [poemId=" + poemId + ", poemTitle=" + poemTitle + ", poemImg=" + poemImg + "]";
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
	public String getPoemImg() {
		return poemImg;
	}
	public void setPoemImg(String poemImg) {
		this.poemImg = poemImg;
	}
	
	
	
}
