package com.cored.permission.util;

import com.cored.permission.pojo.PermissionMenu;

public class LayerMenu {

	private String name; // roleName

	PermissionMenu permissionMenu;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public PermissionMenu getPermissionMenu() {
		return permissionMenu;
	}

	public void setPermissionMenu(PermissionMenu permissionMenu) {
		this.permissionMenu = permissionMenu;
	}

	@Override
	public String toString() {
		return "LayerMenu [name=" + name + ", permissionMenu=" + permissionMenu
				+ "]";
	}
	
	

}
