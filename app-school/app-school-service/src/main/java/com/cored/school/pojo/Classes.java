package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "Classes")
public class Classes extends GeneralBean {

	private static final long serialVersionUID = 6609839586491865737L;

	private String classesnum;// 班级编号
	private String name;// 班级名称
	private Integer personNumber;// 班级人数
	private Integer yearNumber;// 班级年份
	private String classesNumber;// 班级号
	private Teacher teacherDirector;// 班主任信息（）
	private Teacher subTeacherDirector;// 副班主任信息
	private String classeSyllabus;// 班级课程表信息
	private String remark;// 删除

	public String getClassesnum() {
		return classesnum;
	}

	public void setClassesnum(String classesnum) {
		this.classesnum = classesnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPersonNumber() {
		return personNumber;
	}

	public void setPersonNumber(Integer personNumber) {
		this.personNumber = personNumber;
	}

	public Integer getYearNumber() {
		return yearNumber;
	}

	public void setYearNumber(Integer yearNumber) {
		this.yearNumber = yearNumber;
	}

	public String getClassesNumber() {
		return classesNumber;
	}

	public void setClassesNumber(String classesNumber) {
		this.classesNumber = classesNumber;
	}

	public Teacher getTeacherDirector() {
		return teacherDirector;
	}

	public void setTeacherDirector(Teacher teacherDirector) {
		this.teacherDirector = teacherDirector;
	}

	public Teacher getSubTeacherDirector() {
		return subTeacherDirector;
	}

	public void setSubTeacherDirector(Teacher subTeacherDirector) {
		this.subTeacherDirector = subTeacherDirector;
	}

	public String getClasseSyllabus() {
		return classeSyllabus;
	}

	public void setClasseSyllabus(String classeSyllabus) {
		this.classeSyllabus = classeSyllabus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	

}
