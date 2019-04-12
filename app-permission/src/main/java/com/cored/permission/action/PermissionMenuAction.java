package com.cored.permission.action;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cored.framework.action.GeneralAction;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.pojo.PermissionSubMenu;
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;
import com.cored.permission.util.LayerMenu;


/***
 * 前台添加网站菜单模块
 * @author fliay
 *
 */
@Controller
@RequestMapping("/permissionMenu")
public class PermissionMenuAction extends GeneralAction<PermissionMenu> {
	

	private static final Logger log = LoggerFactory
			.getLogger(PermissionMenuAction.class);
	
	@Autowired
	private PermissionMenuService permissionMenuService;
	
	@Autowired
	private PermissionRoleService permissionRoleService;
	/**
	 * 查询所有的网站菜单
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(@ModelAttribute("error") String error){
		ModelAndView modelAndView=new ModelAndView();
		log.info("获取所有网站菜单");
		modelAndView.setViewName("admin/app-school/permissionMenu/list");
		try{
			modelAndView.addObject("error", error);
		modelAndView.addObject("pageList", permissionMenuService.find(new Query(), PermissionMenu.class));
		}catch(Exception e){
			log.error("获取所有网站菜单出错");
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		return modelAndView;
		
	}
	
	/***
	 * 删除菜单
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public ModelAndView delete(@RequestParam(value="id",defaultValue="0") String id,
			@RequestParam(value="type",defaultValue="0") String type,
			RedirectAttributes attr){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("redirect:/permissionMenu/list");
		//如果type为0
		if(type.equals("0")){
			//删除功能菜单
			PermissionMenu menu=this.permissionMenuService.findOneById(id, PermissionMenu.class);
			//如果menu中不存在子菜单那么可以删除
			if(menu.getListPermissionSubMenu().size()==0){
				this.permissionMenuService.remove(menu);
			}else{
				attr.addFlashAttribute("error","当前功能菜单中还有子菜单，请先删除子菜单！！！");
			}
		}else{
			//解析获取到的type 1_ 一级菜单 2_ 二级菜单  3_ 三级菜单
			//菜单级别 0-3
			String level=type.substring(0,type.indexOf("_"));
			String supid ="";
			if(!level.equals("1")){
				//功能菜单id
				supid=type.substring(type.indexOf("_")+1,type.lastIndexOf("_"));
				log.info("功能目录的id"+supid);
			}
			
			//父类id
			String fid=type.substring(type.lastIndexOf("_")+1,type.length());
			log.info("当前删除菜单级别"+level);
			log.info("上级菜单的id"+fid);
			
			if(level.equals("1")){
				//1级菜单
				//根据菜单级别 功能菜单id  上级菜单id去查询
				PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
				List<PermissionSubMenu> listmenu=new ArrayList<PermissionSubMenu>();
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
						if(submenu.getId().equals(id)){
							//判断子菜单是否为空
							if(submenu.getListPermissionSubMenu()!=null){
								if(submenu.getListPermissionSubMenu().size()>0){
									attr.addFlashAttribute("error","当前一级菜单中还有子菜单，请先删除子菜单！！！");
									return modelAndView;
								}
							}
						}else{
							listmenu.add(submenu);
						}
				}
					menu.setListPermissionSubMenu(listmenu);
					this.permissionMenuService.save(menu);
				
			}else if(level.equals("2")){
				//二级菜单
				PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
				List<PermissionSubMenu> listmenu=new ArrayList<PermissionSubMenu>();
				for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
					List<PermissionSubMenu> listmenu2=new ArrayList<PermissionSubMenu>();
					if(submenu.getListPermissionSubMenu()==null){
							listmenu.add(submenu);
					}else{
						for(PermissionSubMenu ssubmenu:submenu.getListPermissionSubMenu()){
							if(ssubmenu.getId().equals(id)){
								//判断子菜单是否为空
								if(ssubmenu.getListPermissionSubMenu()!=null){
									if(ssubmenu.getListPermissionSubMenu().size()>0){
									attr.addFlashAttribute("error","当前二级菜单中还有子菜单，请先删除子菜单！！！");
									return modelAndView;
									}
								}
							}else{
								listmenu2.add(ssubmenu);
							}
							submenu.setListPermissionSubMenu(listmenu2);
							
						}
						listmenu.add(submenu);
					}
					
				}
				menu.setListPermissionSubMenu(listmenu);
				this.permissionMenuService.save(menu);
			}else if(level.equals("3")){
				
				//二级菜单
				PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
				List<PermissionSubMenu> listmenu=new ArrayList<PermissionSubMenu>();
				for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
					
					List<PermissionSubMenu> listmenu2=new ArrayList<PermissionSubMenu>();
					if(submenu.getListPermissionSubMenu()==null){
							listmenu2.add(submenu);
					}
					else{
						for(PermissionSubMenu ssubmenu:submenu.getListPermissionSubMenu()){
							List<PermissionSubMenu> listmenu3=new ArrayList<PermissionSubMenu>();
							if(ssubmenu.getListPermissionSubMenu()==null){
								listmenu3.add(ssubmenu);
							}else{
								for(PermissionSubMenu sssubmenu:ssubmenu.getListPermissionSubMenu()){
									if(sssubmenu.getId().equals(id)){
										log.info("删除三级菜单"+id);
									}else{
										listmenu3.add(sssubmenu);
									}
									ssubmenu.setListPermissionSubMenu(listmenu3);
								}
							}
							listmenu2.add(ssubmenu);
							submenu.setListPermissionSubMenu(listmenu2);
						}
					}
					
					listmenu.add(submenu);
				}
				menu.setListPermissionSubMenu(listmenu);
				this.permissionMenuService.save(menu);
				
				
				
				
				}
			}
			
		return modelAndView ;
	}
	
	
	
	
	
	
	
	
	
	/***
	 * 
	 * @param id
	 * @param menuName 菜单名称
	 * @param type 上级菜单
	 * @param icon 图标
	 * @param orderby 排序
	 * @param url url
	 * @param menuType 是否允许子菜单  1为不允许 2为允许
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(@RequestParam(value="id",defaultValue="0") String id,
			@RequestParam(value="menuName",defaultValue="0") String menuName,
			@RequestParam(value="type",defaultValue="0") String type,
			@RequestParam(value="icon",defaultValue=" ") String icon,
			@RequestParam(value="orderby",defaultValue="0") float orderby,
			@RequestParam(value="url",defaultValue="#") String url,
			@RequestParam(value="menuType",defaultValue="1") String menuType,
			HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		//判断id是否为0如果为0执行添加数据
		if(id!="0"&&!id.equals("0")){
			//执行修改
			//执行添加
			if(type.equals("0")||type=="0"){
				//如果type为0添加功能菜单
				log.info("更新根目录的id"+id);
				PermissionMenu menu=this.permissionMenuService.findOneById(id, PermissionMenu.class);
				if(menu==null)
				menu=new PermissionMenu();
				menu.setMenuName(menuName);
				menu.setMenuUrl(url);
				menu.setOrderby(orderby);
				menu.setIcon(icon);
				this.permissionMenuService.save(menu);
			}else{
				//修改
				
				//解析获取到的type 1_ 一级菜单 2_ 二级菜单  3_ 三级菜单
				//菜单级别 0-3
				String level=type.substring(0,type.indexOf("_"));
				String supid ="";
				if(!level.equals("1")){
					//功能菜单id
					supid=type.substring(type.indexOf("_")+1,type.lastIndexOf("_"));
					log.info("功能目录的id"+supid);
				}
				
				//父类id
				String fid=type.substring(type.lastIndexOf("_")+1,type.length());
				log.info("当前添加数据的菜单级别为"+level);
				log.info("上级菜单的id"+fid);
				
				if(level.equals("1")){
					//1级菜单
					//根据菜单级别 功能菜单id  上级菜单id去查询
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
						if(submenu.getId().equals(id)){
							submenu.setIcon(icon);
							submenu.setMenuName(menuName);
							submenu.setMenuUrl(url);
							submenu.setMenuType(menuType);
							submenu.setOrderby(orderby);
						}
					}
					this.permissionMenuService.save(menu);
				}else if(level.equals("2")){
					//二级菜单
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
						
						if(submenu.getListPermissionSubMenu()!=null)
						for(PermissionSubMenu ssubmenu:submenu.getListPermissionSubMenu()){
							if(ssubmenu.getId().equals(id)){
								ssubmenu.setIcon(icon);
								ssubmenu.setMenuName(menuName);
								ssubmenu.setMenuUrl(url);
								ssubmenu.setMenuType(menuType);
								ssubmenu.setOrderby(orderby);
							}
						}
					}
					this.permissionMenuService.save(menu);
				}else if(level.equals("3")){
					//3级菜单
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
						for(PermissionSubMenu ssubmenu:submenu.getListPermissionSubMenu()){
							for(PermissionSubMenu sssubmenu:ssubmenu.getListPermissionSubMenu()){
								if(sssubmenu.getId().equals(id)){
									sssubmenu.setIcon(icon);
									sssubmenu.setMenuName(menuName);
									sssubmenu.setMenuUrl(url);
									sssubmenu.setMenuType(menuType);
									sssubmenu.setOrderby(orderby);
								}
							}
						}
					}
					this.permissionMenuService.save(menu);
				}
			}
		}else{
			//执行添加
			if(type.equals("0")||type=="0"){
				//如果type为0添加功能菜单
				PermissionMenu menu=new PermissionMenu();
				menu.setMenuName(menuName);
				menu.setMenuUrl(url);
				menu.setIcon(icon);
				menu.setOrderby(orderby);
				menu.setListPermissionSubMenu(new ArrayList<PermissionSubMenu>());
				this.permissionMenuService.insert(menu);
			}else{
				
				//解析获取到的type 1_ 一级菜单 2_ 二级菜单  3_ 三级菜单
				//菜单级别 0-3
				String level=type.substring(0,type.indexOf("_"));
				String supid ="";
				if(!level.equals("1")){
					//功能菜单id
					supid=type.substring(type.indexOf("_")+1,type.lastIndexOf("_"));
					log.info("功能目录的id"+supid);
				}
				
				//父类id
				String fid=type.substring(type.lastIndexOf("_")+1,type.length());
				log.info("当前添加数据的菜单级别为"+level);
				log.info("上级菜单的id"+fid);
				if(level.equals("1")){
					//二级菜单
					//根据菜单级别 功能菜单id  上级菜单id去查询
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					PermissionSubMenu menu2=new PermissionSubMenu();
					menu2.setId(getAutoId());
					menu2.setIcon(icon);
					menu2.setMenuName(menuName);
					menu2.setMenuUrl(url);
					menu2.setMenuType(menuType);
					menu2.setOrderby(orderby);
					menu2.setListPermissionSubMenu(new ArrayList<PermissionSubMenu>());
					menu.getListPermissionSubMenu().add(menu2);
					this.permissionMenuService.save(menu);
				}else if(level.equals("2")){
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
							//menu中的第一个list
						//如果添加数据的fid与submenu中的id相同
						if(submenu.getId().equals(fid)){
							log.info("二级菜单的id为"+fid);
							PermissionSubMenu menu2=new PermissionSubMenu();
							menu2.setId(getAutoId());
							menu2.setIcon(icon);
							menu2.setMenuName(menuName);
							menu2.setMenuUrl(url);
							menu2.setMenuType(menuType);
							menu2.setOrderby(orderby);
							menu2.setListPermissionSubMenu(new ArrayList<PermissionSubMenu>());
							submenu.getListPermissionSubMenu().add(menu2);
						}
					}
					this.permissionMenuService.save(menu);
				}else if(level.equals("3")){
					PermissionMenu menu =this.permissionMenuService.findMenus(level, supid, fid);
					for(PermissionSubMenu submenu:menu.getListPermissionSubMenu()){
							//menu中的第一个list
						//如果添加数据的fid与submenu中的id相同
						for(PermissionSubMenu ssubmenu:submenu.getListPermissionSubMenu()){
							if(ssubmenu.getId().equals(fid)){
								log.info("三级菜单的id为"+fid);
								PermissionSubMenu menu3=new PermissionSubMenu();
								menu3.setId(getAutoId());
								menu3.setIcon(icon);
								menu3.setMenuName(menuName);
								menu3.setMenuUrl(url);
								menu3.setMenuType("1");
								menu3.setOrderby(orderby);
								ssubmenu.getListPermissionSubMenu().add(menu3);
							}
						}
					}
					this.permissionMenuService.save(menu);
				}
			}
		}
		modelAndView.setViewName("redirect:/permissionMenu/list");
		
		
		//执行更新菜单
		
		//更新网站菜单
		List<PermissionMenu> listpermissionMenu =this.permissionMenuService.find(super.craeteQueryWhere("menuName","福山外语节"), PermissionMenu.class);
		
		Query query = super.craeteQueryWhere("roleName", "FuShang-School");
		PermissionRole permissionRole = permissionRoleService.findOneByQuery(query, PermissionRole.class);
		permissionRole.setRoleName("FuShang-School");
		permissionRole.setRemark("福山－外语节");
		permissionRole.setListMenu(listpermissionMenu);
		permissionRoleService.save(permissionRole);
		
		return modelAndView;
	}
	
	//随机生成ID
		public static String getAutoId(){
			java.util.Random random=new java.util.Random();// 定义随机类
			int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
			return String.valueOf(new Date().getTime())+result;
		}

}
