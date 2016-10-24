package com.crm.util;

public class Page {
	private int currentPage;
	private int totalNum;
	private int itemsPerPage;
	
	public Page(){
		
	}
	
	public Page(int currentPage, int totalNum, int itemsPerPage) {
		super();
		this.currentPage = currentPage;
		this.totalNum = totalNum;
		this.itemsPerPage = itemsPerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getItemsPerPage() {
		return itemsPerPage;
	}
	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}
	
	
}
