package com.cored.school.pojo;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "Department")
public class Department extends GeneralBean {

	private static final long serialVersionUID = 3910456509766630246L;
	private String name;// 名字
	private String departmentNum;// 部门编号
	private Teacher manageDepartment;// 部门管理者
	private String remark;// 备注
	private String describe;// 部门描述

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartmentNum() {
		return departmentNum;
	}

	public void setDepartmentNum(String departmentNum) {
		this.departmentNum = departmentNum;
	}

	public Teacher getManageDepartment() {
		return manageDepartment;
	}

	public void setManageDepartment(Teacher manageDepartment) {
		this.manageDepartment = manageDepartment;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Override
	public String toString() {
		return "Department [name=" + name + ", departmentNum=" + departmentNum
				+ ", manageDepartment=" + manageDepartment + ", remark="
				+ remark + ", describe=" + describe + "]";
	}

}
