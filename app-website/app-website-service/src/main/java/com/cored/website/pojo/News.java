package com.cored.website.pojo;

import java.util.Date;
import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;
import com.cored.school.pojo.MessageRepository_File;
@Document(collection = "News")
public class News extends GeneralBean{

	private static final long serialVersionUID = -549990568667629540L;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 是否能展示到bananer
	 */
	private Integer state;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 作者
	 */
	private String author;
	/**
	 * 图片地址
	 */
	private String bananerPic;
	/**
	 * 浏览次数
	 */
	private Integer browseTimes;

	/**
	 * 模块id
	 */
	private String moduleId;
	
	/**
	 * 模块name
	 */
	private String moduleName;
	/**
	 * 
	 * token
	 */
	private String token;
	
	/**
	 * 置顶
	 */
	private Integer top;
	
	/**
	 * 来源
	 */
	private String source;
	/**
	 * 接受时间
	 * @return
	 */
	
	private Date acceptTime;
	
	
	private String privates;//是否是私有的，如果是私有的，需要登录后才能看详细信息。1:不需要，其他都需要
	
	
	
	

	
	
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}

	public Date getAcceptTime() {
		return acceptTime;
	}
	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBananerPic() {
		return bananerPic;
	}
	public void setBananerPic(String bananerPic) {
		this.bananerPic = bananerPic;
	}
	public Integer getBrowseTimes() {
		return browseTimes;
	}
	public void setBrowseTimes(Integer browseTimes) {
		this.browseTimes = browseTimes;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public String getPrivates() {
		return privates;
	}
	public void setPrivates(String privates) {
		this.privates = privates;
	}
	
	@Override
	public String toString() {
		return "News [title=" + title + ", state=" + state + ", content="
				+ content + ", author=" + author + ", bananerPic=" + bananerPic
				+ ", browseTimes=" + browseTimes + ", moduleId=" + moduleId
				+ ", moduleName=" + moduleName + ", token=" + token + ", top="
				+ top + ", source=" + source + ", acceptTime=" + acceptTime
				+ "]";
	}

	
	

}
