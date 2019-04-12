package com.cored.permission.pojo;

import java.util.List;

import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

@Document(collection = "PermissionRole")
public class PermissionRole extends GeneralBean {

	private static final long serialVersionUID = 2291969745133326024L;
	private String roleName;// 角色名称.
	private String remark;// 备注.
	private List<PermissionMenu> listMenu;// 当前角色的权限


	@Override
	public String toString() {
		return "PermissionRole [roleName=" + roleName + ", remark=" + remark
				+ ", listMenu=" + listMenu + "]";
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<PermissionMenu> getListMenu() {
		return listMenu;
	}

	public void setListMenu(List<PermissionMenu> listMenu) {
		this.listMenu = listMenu;
	}

	public String getRoleName() {
		return roleName;
	}

	


	

}
