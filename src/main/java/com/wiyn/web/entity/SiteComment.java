package com.wiyn.web.entity;

import java.util.Date;

public class SiteComment {

	private String id;
	private String content;
	private Date regDate;
	private String siteBoardId;
	private String memberId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getSiteBoardId() {
		return siteBoardId;
	}
	public void setSiteBoardId(String siteBoardId) {
		this.siteBoardId = siteBoardId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
