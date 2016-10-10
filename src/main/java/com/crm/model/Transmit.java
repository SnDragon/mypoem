package com.crm.model;

import java.sql.Timestamp;

public class Transmit {
	private Integer userId;
	private Integer poemId;
	private String transmitComment;
	private Timestamp transmitTime;
	
	@Override
	public String toString() {
		return "Transmit [userId=" + userId + ", poemId=" + poemId + ", transmitComment=" + transmitComment
				+ ", transmitTime=" + transmitTime + "]";
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
	
}
