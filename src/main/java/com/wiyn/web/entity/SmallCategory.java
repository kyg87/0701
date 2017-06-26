package com.wiyn.web.entity;

public class SmallCategory {

	private String id;
	private String name;
	private String bigCategoryId;
	private String hot;
	
	public String getHot() {
		return hot;
	}
	public void setHot(String hot) {
		this.hot = hot;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBigCategoryId() {
		return bigCategoryId;
	}
	public void setBigCategoryId(String bigCategoryId) {
		this.bigCategoryId = bigCategoryId;
	}
	
}
