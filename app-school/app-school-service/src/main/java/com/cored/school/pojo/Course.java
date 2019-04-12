package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "course")
public class Course extends GeneralBean {

	private static final long serialVersionUID = -5748360801997130014L;
	private String coursenum;// 科目编号
	private String name;// 名字
	private String courseNature;// 课程性质
	private String remark;

	public String getCoursenum() {
		return coursenum;
	}

	public void setCoursenum(String coursenum) {
		this.coursenum = coursenum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCourseNature() {
		return courseNature;
	}

	public void setCourseNature(String courseNature) {
		this.courseNature = courseNature;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Course [coursenum=" + coursenum + ", name=" + name
				+ ", courseNature=" + courseNature + ", remark=" + remark + "]";
	}

}
