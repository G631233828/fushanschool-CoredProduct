package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "User")
public class User extends GeneralBean {
	private static final long serialVersionUID = -3454854678157441161L;
	private String name;// 姓名
	private String username;// 用户名
	private String password;// 密码
	private String role;// 角色
	private String card;// 身份证（用于找回密码，绑定微信）
	private String headImage;// 头像
	private String weChatCode;// 微信id
	private userType type;// 帐号内型:学生，老师，学校管理员，其他.
	private String teacherIdOrStudentId;// 老师id或学生id;

	private String schooldIds;// 学校编号.(用于：用户于登录时，验证是哪个学校。)
	private String remark;// 备注

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getHeadImage() {
		return headImage;
	}

	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}

	public String getWeChatCode() {
		return weChatCode;
	}

	public void setWeChatCode(String weChatCode) {
		this.weChatCode = weChatCode;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getTeacherIdOrStudentId() {
		return teacherIdOrStudentId;
	}

	public void setTeacherIdOrStudentId(String teacherIdOrStudentId) {
		this.teacherIdOrStudentId = teacherIdOrStudentId;
	}

	public userType getType() {
		return type;
	}

	public void setType(userType type) {
		this.type = type;
	}

	public String getSchooldIds() {
		return schooldIds;
	}

	public void setSchooldIds(String schooldIds) {
		this.schooldIds = schooldIds;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", username=" + username + ", password="
				+ password + ", role=" + role + ", card=" + card
				+ ", headImage=" + headImage + ", weChatCode=" + weChatCode
				+ ", type=" + type + ", teacherIdOrStudentId="
				+ teacherIdOrStudentId + ", schooldIds=" + schooldIds
				+ ", remark=" + remark + "]";
	}

	public enum userType {
		teacherUser, studentUser, otheruser, SchoolManager, superManager
	}

}
