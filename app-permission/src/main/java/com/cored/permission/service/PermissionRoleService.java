package com.cored.permission.service;

import org.springframework.stereotype.Repository;

import com.cored.framework.service.GeneralServiceImpl;
import com.cored.permission.pojo.PermissionRole;

@Repository("permissionRoleService")
public class PermissionRoleService extends GeneralServiceImpl<PermissionRole>{
	
	//以ID查找
	public PermissionRole findByid(String id) throws Exception{
		PermissionRole user=super.findOneById(id,PermissionRole.class);
		if(user!=null)
			return user;
		
	return null;
	}
}
