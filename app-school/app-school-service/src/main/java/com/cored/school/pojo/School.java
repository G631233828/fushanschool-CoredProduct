package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;
import com.cored.school.pojo.base.BaseNatrueid;

/**
 * 学校基本信息 pojo
 * 
 * @author aaron
 *
 */
@Document(collection = "School")
public class School extends GeneralBean {
	private static final long serialVersionUID = -4868259366058004002L;

	private String name;// 学校名称
	private String englishName;// 学校英文名
	private String shorts;// 学校简称
	private String address;// 学校地址
	private String telPhone;// 学校地址
	private String email;// 邮箱
	private String remark;// 备注
	private String schoolCreateTime;// 学校创办时间
	private BaseNatrueid natrueid;// 学校性质
	private String coredIds;// 学校编号，从服务来。
	private String area;// 学校区域。
	private String ipAddress;// 学校IP地址
	private String port;// port端号

	private SchoolState state;// 状态，//试用到期停止，正常使用，永久不过期

	private String schoolproduct;// 学校有哪些产品.数组，表示学校有可能有多个产品.
	private User user;// 超级管理员帐号信息。

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public String getShorts() {
		return shorts;
	}

	public void setShorts(String shorts) {
		this.shorts = shorts;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelPhone() {
		return telPhone;
	}

	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public BaseNatrueid getNatrueid() {
		return natrueid;
	}

	public void setNatrueid(BaseNatrueid natrueid) {
		this.natrueid = natrueid;
	}

	public String getCoredIds() {
		return coredIds;
	}

	public void setCoredIds(String coredIds) {
		this.coredIds = coredIds;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getSchoolCreateTime() {
		return schoolCreateTime;
	}

	public void setSchoolCreateTime(String schoolCreateTime) {
		this.schoolCreateTime = schoolCreateTime;
	}

	public SchoolState getState() {
		return state;
	}

	public void setState(SchoolState state) {
		this.state = state;
	}

	public String getSchoolproduct() {
		return schoolproduct;
	}

	public void setSchoolproduct(String schoolproduct) {
		this.schoolproduct = schoolproduct;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "School [name=" + name + ", englishName=" + englishName
				+ ", shorts=" + shorts + ", address=" + address + ", telPhone="
				+ telPhone + ", email=" + email + ", remark=" + remark
				+ ", schoolCreateTime=" + schoolCreateTime + ", natrueid="
				+ natrueid + ", coredIds=" + coredIds + ", area=" + area
				+ ", ipAddress=" + ipAddress + ", port=" + port + ", state="
				+ state + ", schoolproduct=" + schoolproduct + ", user=" + user
				+ "]";
	}

	// 试用到期，正常使用到期，永久不过期
	public enum SchoolState {
		normalRun, stopRun
	}

}
