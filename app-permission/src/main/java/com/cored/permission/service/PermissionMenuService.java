package com.cored.permission.service;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.cored.framework.service.GeneralServiceImpl;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionSubMenu;

@Repository("permissionMenuService")
public class PermissionMenuService extends GeneralServiceImpl<PermissionMenu>{
	
	//以ID查找
		public PermissionMenu findByid(String id) throws Exception{
			PermissionMenu menu=super.findOneById(id, PermissionMenu.class);
			if(menu!=null)
				return menu;
			else
				return null;
		}
		
		/**
		 * 加载所有的产品
		 */
		public List<PermissionMenu> findByAll(){
			List<PermissionMenu> listProduct;
			try {
				Query query=new Query();
				query.addCriteria(Criteria.where("orderby").gt(-1));
				listProduct = super.find(query,PermissionMenu.class);
				if(listProduct==null) listProduct=new ArrayList<PermissionMenu>();
				return listProduct;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return new ArrayList<PermissionMenu>();//返回为空
		}

	
	
	
	/**
	 * 
	 * @param level 菜单级别
	 * @param supid 根目录id
	 * @param fid   父级菜单id
	 * @return
	 */
	public PermissionMenu  findMenus(String level,String supid,String fid){
		ObjectId o=null;
		if(supid.equals("")){
			 o=new ObjectId(fid);
		}else{
			 o=new ObjectId(supid);
		}
		Query query=new Query();
		if(level.equals("1")){
			//查询1级菜单
			query.addCriteria(Criteria.where("_id").is(o));
		}else if(level.equals("2")){
			//查询2级菜单
			//查询1级菜单
			query.addCriteria(Criteria.where("_id").is(o)).addCriteria(Criteria.where("listPermissionSubMenu.menuType").is("2")).addCriteria(Criteria.where("listPermissionSubMenu._id").is(fid));
		}else if(level.equals("3")){
			//查询3级菜单
			query.addCriteria(Criteria.where("_id").is(o)).addCriteria(Criteria.where("listPermissionSubMenu.listPermissionSubMenu.menuType").is("2")).addCriteria(Criteria.where("listPermissionSubMenu.listPermissionSubMenu._id").is(fid));
			
		}
		PermissionMenu menu=super.findOneByQuery(query, PermissionMenu.class);
		if(menu==null)
			return null;
		else
			return menu;
	}
	
	
	
	
	

}
