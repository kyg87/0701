package com.wiyn.web.entity;

public class FreeCommentLike {
	
	private String id;
    private String freeCommentId;
    private String memberId;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFreeCommentId() {
		return freeCommentId;
	}
	public void setFreeCommentId(String freeCommentId) {
		this.freeCommentId = freeCommentId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


}
