package com.crm.util;

import java.sql.Timestamp;

public class TransmitUtil {
	private Integer transmitId;
	private String transmitComment;
	private Timestamp transmitTime;
	private Integer poemId;
	private Integer authorId;
	private String authorName;
	private String poemTitle;
	private String poemImg;
	
	
	
	
	@Override
	public String toString() {
		return "TransmitUtil [transmitId=" + transmitId + ", poemId=" + poemId + ", transmitComment=" + transmitComment
				+ ", transmitTime=" + transmitTime + ", authorId=" + authorId + ", authorName=" + authorName
				+ ", poemTitle=" + poemTitle + ", poemImg=" + poemImg + "]";
	}
	public Integer getTransmitId() {
		return transmitId;
	}
	public void setTransmitId(Integer transmitId) {
		this.transmitId = transmitId;
	}
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
	}
	public String getTransmitComment() {
		return transmitComment;
	}
	public void setTransmitComment(String transmitComment) {
		this.transmitComment = transmitComment;
	}
	public Timestamp getTransmitTime() {
		return transmitTime;
	}
	public void setTransmitTime(Timestamp transmitTime) {
		this.transmitTime = transmitTime;
	}
	public Integer getAuthorId() {
		return authorId;
	}
	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
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
	public String getPoemImg() {
		return poemImg;
	}
	public void setPoemImg(String poemImg) {
		this.poemImg = poemImg;
	}
	
	
	
}
