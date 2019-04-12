package com.cored.website.bean;

import java.util.List;

import com.cored.website.pojo.News;
//主网站的首页使用
public class WebMainBean {

	private String id;
	private String name;
	private String sameDirectory;//同级目录ID
	private String superDirectory;//父级目录
	
	private List<News> listNew;

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

	public List<News> getListNew() {
		return listNew;
	}

	public void setListNew(List<News> listNew) {
		this.listNew = listNew;
	}

	public String getSameDirectory() {
		return sameDirectory;
	}

	public void setSameDirectory(String sameDirectory) {
		this.sameDirectory = sameDirectory;
	}

	public String getSuperDirectory() {
		return superDirectory;
	}

	public void setSuperDirectory(String superDirectory) {
		this.superDirectory = superDirectory;
	}
	

}
