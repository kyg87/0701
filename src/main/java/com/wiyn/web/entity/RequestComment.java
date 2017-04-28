package com.wiyn.web.entity;

import java.util.Date;

public class RequestComment {

	private String id;
	private String content;
	private Date regDate;
	private String requestBoardId;
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
	public String getRequestBoardId() {
		return requestBoardId;
	}
	public void setRequestBoardId(String requestBoardId) {
		this.requestBoardId = requestBoardId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
