package com.wiyn.web.entity;

import java.util.Date;
import java.util.List;

public class SiteBoard {
	
	private String id;
	private String title;
	private String content;
	private Date regDate;
	private int hit;
	private String url;
	private String tagId;
	private String memberId;
	private String bigCategoryId;
	private String smallCategoryId;
	
	private BigCategory bigCategory;
	private SmallCategory smallCategory;
	
	private List<SiteComment> siteComments;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTagId() {
		return tagId;
	}
	public void setTagId(String tagId) {
		this.tagId = tagId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBigCategoryId() {
		return bigCategoryId;
	}
	public void setBigCategoryId(String bigCategoryId) {
		this.bigCategoryId = bigCategoryId;
	}
	public BigCategory getBigCategory() {
		return bigCategory;
	}
	public void setBigCategory(BigCategory bigCategory) {
		this.bigCategory = bigCategory;
	}
	public SmallCategory getSmallCategory() {
		return smallCategory;
	}
	public void setSmallCategory(SmallCategory smallCategory) {
		this.smallCategory = smallCategory;
	}
	public String getSmallCategoryId() {
		return smallCategoryId;
	}
	public void setSmallCategoryId(String smallCategoryId) {
		this.smallCategoryId = smallCategoryId;
	}
	public List<SiteComment> getSiteComments() {
		return siteComments;
	}
	public void setSiteComments(List<SiteComment> siteComments) {
		this.siteComments = siteComments;
	}
	

}
