package com.crm.model;


public class Label {
	private Integer labelId;
	private String labelName;
	private String labelDescription;
	@Override
	public String toString() {
		return "Label [labelId=" + labelId + ", labelName=" + labelName + ", labelDescription=" + labelDescription
				+ "]";
	}
	public Integer getLabelId() {
		return labelId;
	}
	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}
	public String getLabelName() {
		return labelName;
	}
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	public String getLabelDescription() {
		return labelDescription;
	}
	public void setLabelDescription(String labelDescription) {
		this.labelDescription = labelDescription;
	}
	
	
	
}
