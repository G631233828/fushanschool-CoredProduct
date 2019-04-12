package com.cored.school.pojo;

import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "Teacher")
public class Teacher extends GeneralBean {

	private static final long serialVersionUID = -3278124580909537901L;
	private String teachernum;// 老师编号
	private String name; // 姓名
	private String birthDate;// 出生日期
	private String sex; // 性别
	private String address; // 地址
	private String email; // email
	private String telPhone;// 电话号码
	private String cardId;// 身份证Id
	private String entryTime;// 入职时间
	private String department;// 部门信息
	private List<Course> course;// 老师所带课程信息.
	private Classes classeTeach; // 老师所带班级.
	public User user;// 用户信息
	private String remark;

	public String getTeachernum() {
		return teachernum;
	}

	public void setTeachernum(String teachernum) {
		this.teachernum = teachernum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelPhone() {
		return telPhone;
	}

	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(String entryTime) {
		this.entryTime = entryTime;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public List<Course> getCourse() {
		return course;
	}

	public void setCourse(List<Course> course) {
		this.course = course;
	}

	public Classes getClasseTeach() {
		return classeTeach;
	}

	public void setClasseTeach(Classes classeTeach) {
		this.classeTeach = classeTeach;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Teacher [teachernum=" + teachernum + ", name=" + name
				+ ", birthDate=" + birthDate + ", sex=" + sex + ", address="
				+ address + ", email=" + email + ", telPhone=" + telPhone
				+ ", cardId=" + cardId + ", entryTime=" + entryTime
				+ ", department=" + department + ", course=" + course
				+ ", classeTeach=" + classeTeach + ", user=" + user
				+ ", remark=" + remark + "]";
	}

}
