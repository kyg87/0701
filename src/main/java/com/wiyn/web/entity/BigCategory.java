package com.wiyn.web.entity;

import java.util.List;

public class BigCategory {

	

	private String id;
	private String name;
	
	private List<SmallCategory> smallCategory;
	
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
	
	public List<SmallCategory> getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(List<SmallCategory> smallCategory) {
		this.smallCategory = smallCategory;
	}
	

	
	
}
