package com.crm.model;

import java.sql.Timestamp;

public class Transmit {
	private Integer transmitId;
	private Integer userId;
	private Integer poemId;
	private String transmitComment;
	private Timestamp transmitTime;
	private Integer numOfComment;
	private Integer numOfSupport;
	
	
	@Override
	public String toString() {
		return "Transmit [transmitId=" + transmitId + ", userId=" + userId + ", poemId=" + poemId + ", transmitComment="
				+ transmitComment + ", transmitTime=" + transmitTime + ", numOfComment=" + numOfComment
				+ ", numOfSupport=" + numOfSupport + "]";
	}
	
	public Integer getNumOfComment() {
		return numOfComment;
	}
	public void setNumOfComment(Integer numOfComment) {
		this.numOfComment = numOfComment;
	}
	public Integer getNumOfSupport() {
		return numOfSupport;
	}
	public void setNumOfSupport(Integer numOfSupport) {
		this.numOfSupport = numOfSupport;
	}
	
	public Integer getTransmitId() {
		return transmitId;
	}
	public void setTransmitId(Integer transmitId) {
		this.transmitId = transmitId;
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
