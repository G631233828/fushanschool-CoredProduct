package com.cored.permission.pojo;

import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.cored.framework.pojo.GeneralBean;

/**
 * 
 * @author 权限菜单(此权限为顶级权限,它决定于有哪些产品)
 *
 */
@Document(collection = "PermissionMenu")
public class PermissionMenu extends GeneralBean {

	private static final long serialVersionUID = -1760390114905267294L;
	private String pid;// 子菜单对应的父菜单id,pid=0表示一线菜单.
	private String menuName;// 菜单名
	private String menuType;// 菜单的类型.
	private String icon;// 图片
	private String menuUrl;// 访问的地址
	private float orderby;// 排序
	private String remark;

	private List<PermissionSubMenu> listPermissionSubMenu;// 些菜单表示该模块下有多子菜单,


	@Override
	public String toString() {
		return "PermissionMenu [pid=" + pid + ", menuName=" + menuName
				+ ", menuType=" + menuType + ", icon=" + icon + ", menuUrl="
				+ menuUrl + ", orderby=" + orderby + ", remark=" + remark
				+ ", listPermissionSubMenu=" + listPermissionSubMenu + "]";
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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
