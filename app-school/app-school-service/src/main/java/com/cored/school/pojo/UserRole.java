package com.cored.school.pojo;


import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;
import com.cored.permission.pojo.PermissionMenu;

//用户角色管理
@Document(collection = "UserRole")
public class UserRole extends GeneralBean {

	private static final long serialVersionUID = 106864705085651431L;

	private String name;
	private String remark;
	private List<PermissionMenu> permissionMenu;// 用户菜单功能
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}



	public List<PermissionMenu> getPermissionMenu() {
		return permissionMenu;
	}

	public void setPermissionMenu(List<PermissionMenu> permissionMenu) {
		this.permissionMenu = permissionMenu;
	}
	
	

}
