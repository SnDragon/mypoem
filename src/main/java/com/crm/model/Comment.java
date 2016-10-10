package com.crm.model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Comment {
	private Integer commentId;
	private Integer poemId;
	private Integer parentId;
	private String parentUserName;
	private Integer commentorId;
	private String commentorName;
	private String commentText;
	private Timestamp commentTime;
	private String commentThread;
	private ArrayList<Comment> children; 
	
	
	
	
	public ArrayList<Comment> getChildren() {
		return children;
	}

	public void setChildren(ArrayList<Comment> children) {
		this.children = children;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", poemId=" + poemId + ", parentId=" + parentId + ", parentUserName="
				+ parentUserName + ", commentorId=" + commentorId + ", commentorName=" + commentorName
				+ ", commentText=" + commentText + ", commentTime=" + commentTime + ", commentThread=" + commentThread
				+ "]";
	}
	
	public Integer getCommentId() {
		return commentId;
	}
	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
	public Integer getPoemId() {
		return poemId;
	}
	public void setPoemId(Integer poemId) {
		this.poemId = poemId;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getParentUserName() {
		return parentUserName;
	}
	public void setParentUserName(String parentUserName) {
		this.parentUserName = parentUserName;
	}
	public Integer getCommentorId() {
		return commentorId;
	}
	public void setCommentorId(Integer commentorId) {
		this.commentorId = commentorId;
	}
	public String getCommentorName() {
		return commentorName;
	}
	public void setCommentorName(String commentorName) {
		this.commentorName = commentorName;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	public String getCommentThread() {
		return commentThread;
	}
	public void setCommentThread(String commentThread) {
		this.commentThread = commentThread;
	}
	
	
}
