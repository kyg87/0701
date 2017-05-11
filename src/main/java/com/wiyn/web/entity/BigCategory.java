package com.wiyn.web.entity;

import java.util.List;

public class BigCategory {

	

	private String id;
	private String name;
	
	private List<SmallCategory> smallcategory;
	
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
	
	public List<SmallCategory> getSmallcategory() {
		return smallcategory;
	}
	public void setSmallcategory(List<SmallCategory> smallcategory) {
		this.smallcategory = smallcategory;
	}
	
	
}
