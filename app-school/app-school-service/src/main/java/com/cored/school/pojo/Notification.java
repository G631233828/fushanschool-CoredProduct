package com.cored.school.pojo;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

/**
 * 学校通知
 * 
 * @author 学校通知
 *
 */
@Document(collection = "Notification")
public class Notification extends GeneralBean {
	private static final long serialVersionUID = -5104448023045936474L;
	private String title;// 标题
	private String content;// 内容
	private String sendDate;// 发送日期
	private Ntype type;// 1:家校通知，2校园通知,3：全部.
	private String author;//作者

	public enum Ntype{
		JNOTIF,SNOTIF,ANOTIF
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

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	

	public Ntype getType() {
		return type;
	}

	public void setType(Ntype type) {
		this.type = type;
	}
	

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Override
	public String toString() {
		return "Notification [title=" + title + ", content=" + content
				+ ", sendDate=" + sendDate + ", type=" + type + "]";
	}

}
