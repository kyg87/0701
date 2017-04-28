package com.wiyn.web.entity;

import java.util.Date;

public class FreeBoard {
	
	private String id;
    private String title;
    private String contentSrc;
    private String content;
    private int hit;
    private Date regDate;
    private String memberId;
    
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
	public String getContentSrc() {
		return contentSrc;
	}
	public void setContentSrc(String contentSrc) {
		this.contentSrc = contentSrc;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



}
