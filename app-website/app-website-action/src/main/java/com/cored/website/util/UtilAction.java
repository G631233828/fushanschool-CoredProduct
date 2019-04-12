package com.cored.website.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cored.framework.util.CommonEnum;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.pojo.PermissionSubMenu;

public class UtilAction {
	private static final Logger log = LoggerFactory.getLogger(UtilAction.class);
	
		//查找网站下面的一级菜单中的所有菜单
		public static Collection<String> getSubListId(List<PermissionRole> listRole,
				String moduleId) {
			//获取菜单数据  
			List<String> listId=new ArrayList<String>();
			log.info("select list Menu:"+listRole.toString());
			
			for (PermissionRole pr : listRole) {
				for (PermissionMenu pm : pr.getListMenu()) {
					for (PermissionSubMenu psmsuper : pm.getListPermissionSubMenu()) {
						if (psmsuper.getId().equals(moduleId)) {//一级菜单
							for (PermissionSubMenu psm : psmsuper.getListPermissionSubMenu()) {
								if(psm.getListPermissionSubMenu()!=null){//二级菜单
									for(PermissionSubMenu subpms:psm.getListPermissionSubMenu()){
										if(subpms.getListPermissionSubMenu()!=null){//三级单单
											for(PermissionSubMenu subpms2:subpms.getListPermissionSubMenu()){
												listId.add(subpms2.getId());
											}
										}
										listId.add(subpms.getId());
									}
								}
								listId.add(psm.getId());//添加子菜单下的Id
							}
						}
						
					}
				}
			}
			log.info(listId.toString());
			return listId;
		}
		
		
		
		
		
		
			//查找网站下面的二级菜单中的所有菜单
				public static Collection<String> getTwoSubListId(List<PermissionRole> listRole,
						String moduleId,String superid) {
					//获取菜单数据  
					List<String> listId=new ArrayList<String>();
					log.info("select list Menu:"+listRole.toString());
					
					for (PermissionRole pr : listRole) {
						for (PermissionMenu pm : pr.getListMenu()) {
							for (PermissionSubMenu psmsuper : pm.getListPermissionSubMenu()) {
								if (psmsuper.getId().equals(superid)) {//一级菜单
									for (PermissionSubMenu psm : psmsuper.getListPermissionSubMenu()) {
										if(psm.getId().equals(moduleId)){//验证是否是一级菜单中的二级菜单
											if(psm.getListPermissionSubMenu()!=null){//二级菜单
												for(PermissionSubMenu subpms:psm.getListPermissionSubMenu()){
													if(subpms.getListPermissionSubMenu()!=null){//三级单单
														for(PermissionSubMenu subpms2:subpms.getListPermissionSubMenu()){
															listId.add(subpms2.getId());
														}
													}
													listId.add(subpms.getId());
												}
											}
										}
										
									}
								}
								
							}
						}
					}
					log.info(listId.toString());
					return listId;
				}

}
