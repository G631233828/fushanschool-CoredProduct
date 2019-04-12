package com.cored.school.pojo;

import java.util.Date;


/**
 * 上传的某个资料组，进行评论。
 * @author mac
 *
 */
public class MessageRepository_Comment {
	
	private String id;
	private String name;//姓名
	private String message;//评论内容
	private String audit;//审核  1:通过，0或其他不通过
	private Date commentdate;//评论时间
	
	public Date getCommentdate() {
		return commentdate;
	}
	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAudit() {
		return audit;
	}
	public void setAudit(String audit) {
		this.audit = audit;
	}
	

	
}
