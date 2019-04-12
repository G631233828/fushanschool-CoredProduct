package com.cored.permission.pojo;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.annotation.Id;

public class PermissionSubMenu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5565815683650063969L;
	private String id;
	private String menuName;// 菜单名
	private String menuType;// 1:父菜单,2:子菜单(功能菜单)
	private String icon;// 图片
	private String menuUrl;// 访问的地址
	private float orderby;// 排序
	private String remark;//备注

	private List<PermissionSubMenu> listPermissionSubMenu;// 表示我还有子菜单；（当menuType:父菜单类型是生效）

	@Override
	public String toString() {
		return "PermissionSubMenu [id=" + id + ", menuName=" + menuName
				+ ", menuType=" + menuType + ", icon=" + icon + ", menuUrl="
				+ menuUrl + ", orderby=" + orderby + ", remark=" + remark
				+ ", listPermissionSubMenu=" + listPermissionSubMenu + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public float getOrderby() {
		return orderby;
	}

	public void setOrderby(float orderby) {
		this.orderby = orderby;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<PermissionSubMenu> getListPermissionSubMenu() {
		return listPermissionSubMenu;
	}

	public void setListPermissionSubMenu(
			List<PermissionSubMenu> listPermissionSubMenu) {
		this.listPermissionSubMenu = listPermissionSubMenu;
	}

}
