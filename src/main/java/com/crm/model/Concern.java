package com.crm.model;

public class Concern {
	private Integer concernedId;//被关注者id
	private Integer concernerId;//关注者id
	public Integer getConcernedId() {
		return concernedId;
	}
	public void setConcernedId(Integer concernedId) {
		this.concernedId = concernedId;
	}
	public Integer getConcernerId() {
		return concernerId;
	}
	public void setConcernerId(Integer concernerId) {
		this.concernerId = concernerId;
	}
	
	
}
