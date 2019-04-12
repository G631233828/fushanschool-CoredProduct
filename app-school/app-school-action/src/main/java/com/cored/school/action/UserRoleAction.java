package com.cored.school.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.pojo.PermissionSubMenu;
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;
import com.cored.permission.util.LayerMenu;
import com.cored.school.pojo.School;
import com.cored.school.pojo.User;
import com.cored.school.pojo.UserRole;
import com.cored.school.service.UserRoleService;

@Controller
@RequestMapping("/schoolPermissionRole")
public class UserRoleAction extends GeneralAction<UserRole> {
	private static final Logger log = LoggerFactory
			.getLogger(UserRoleAction.class);

	@Autowired
	private UserRoleService userRoleService;//用户信息
	@Autowired
	private PermissionRoleService permissionRoleService;// 角色信息
	
	@Autowired
	private PermissionMenuService permissionMenuService;//菜单
	
	
	
	@RequestMapping("/list")
	public ModelAndView findlist(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/userRole/list");
		System.out.println("查询用户所有信息");
		try {
			// 分页查询数据
			//查询学校所有老师信息
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			modelAndView.addObject("pageList", userRoleService.find(super.getQueryForSchool("schoolId", 
					user.getSchoolId()),UserRole.class));
			
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}
		return modelAndView;// 返回到学校信息
	}
	
	@RequestMapping("/updateRole")
	public ModelAndView updateRole(
			@RequestParam(value = "id", defaultValue = "0") String id,
			HttpSession session,String check_box) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/schoolPermissionRole/list");
		UserRole  userRole= null;
		//查找当前学校下的所有角色.
		userRole=this.userRoleService.findOneById(id, UserRole.class);
		//加载学校所有的权限菜单
		//	乡村少年宫，主网站，特色课，文明创建，后台管理
		//"WebMain","CivilizationWeb","FeatureWeb","RuralChildrenPalaceWeb"
		String []selectRoleName={"Admin","WebMain","FuShang-School"};
		
		List<LayerMenu> listLayerMenu=new ArrayList();
		for(String roleName:selectRoleName){
			listLayerMenu.add(loadMenu(roleName));
		}
		log.info("前台传进来的ID:"+check_box);
		
		userRole.setPermissionMenu(getUserRoleMenu(listLayerMenu,check_box));
		
		this.userRoleService.save(userRole);//更新
		return modelAndView;

	}
	//
	public List<PermissionMenu> getUserRoleMenu(List<LayerMenu> listLayerMenu,String check_box){
		
		List<PermissionMenu>listpm=new ArrayList<PermissionMenu>();//添加到角色中的菜单信息
		
		//permissionMenu
		for(LayerMenu lm:listLayerMenu){
			PermissionMenu pm=null;//返回值
			pm=lm.getPermissionMenu();
			
			//一级菜单
			List<PermissionSubMenu> superListMenu=new ArrayList<PermissionSubMenu>();
			
			for(PermissionSubMenu tpm:lm.getPermissionMenu().getListPermissionSubMenu()){//一级菜单
				String checkSubMenu="NO";//初始化子菜单为NO,如果有子菜单值变为：YES
				//二级菜单
				List<PermissionSubMenu> subListMenu=new ArrayList<PermissionSubMenu>();
				if(tpm.getListPermissionSubMenu()!=null){
					for(PermissionSubMenu stpm:tpm.getListPermissionSubMenu()){//只菜单，二级菜单.
						if(check_box.indexOf(stpm.getId())!=-1){
							checkSubMenu="YES";
							subListMenu.add(stpm);
						}
					}
				}
				
				if(check_box.indexOf(tpm.getId())!=-1 ||checkSubMenu.equals("YES")){
					PermissionSubMenu sub=tpm;
					sub.setListPermissionSubMenu(new ArrayList<PermissionSubMenu>());
					sub.setListPermissionSubMenu(subListMenu);//添加二级菜单
					superListMenu.add(sub);
				}
				
			}
			//添加
			pm.setListPermissionSubMenu(new ArrayList<PermissionSubMenu>());
			pm.setListPermissionSubMenu(superListMenu);
			
			
			listpm.add(pm);
		}
		log.info(listpm.toString());
		return listpm;
		
	}
	
	
	
	
	/**
	 * 跳转到用户权限管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/updateRolefind")
	public ModelAndView updateRolefind(
			@RequestParam(value = "id", defaultValue = "0") String id,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/userRole/role");
		UserRole  userRole= null;
		try {
			//查找当前学校下的所有角色.
			userRole=this.userRoleService.findOneById(id, UserRole.class);
			//加载学校所有的权限菜单
			//	乡村少年宫，主网站，特色课，文明创建，后台管理
			//"WebMain","CivilizationWeb","FeatureWeb","RuralChildrenPalaceWeb"
			String []selectRoleName={"Admin","WebMain"};
			List<LayerMenu> listLayerMenu=new ArrayList();
			for(String roleName:selectRoleName){
				listLayerMenu.add(loadMenu(roleName));
			}
			
			//在把数据传到前台时需要检查是否有已选择的权限菜单
			String haveRoleMenuId=getRoleMenuId(userRole.getPermissionMenu());
			//绑定已有的菜单，和当前的菜单
			
			List<LayerMenu> l=getCheckMenu(listLayerMenu,haveRoleMenuId);
			log.info("check:"+l.toString());
			modelAndView.addObject("listLayerMenu",getCheckMenu(listLayerMenu,haveRoleMenuId));
			
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}// 以ID查找当前用户信息
		modelAndView.addObject("userRole", userRole);
		return modelAndView;

	}
	
	public List<LayerMenu> getCheckMenu(List<LayerMenu> listLayerMenu,String ids){
		if(ids==null || ids=="")return listLayerMenu;
		List<LayerMenu> list=new ArrayList<LayerMenu>();//返回的数据信息
		//一级菜单
		List<PermissionSubMenu> superListMenu=new ArrayList<PermissionSubMenu>();
		
		
		
		for(LayerMenu lm:listLayerMenu){
			//PermissionSubMenu menu:lm.getPermissionMenu().getListPermissionSubMenu()
			//二级菜单
			List<PermissionSubMenu> subListMenu=new ArrayList<PermissionSubMenu>();
			for(int i=0;i<lm.getPermissionMenu().getListPermissionSubMenu().size();i++){
				PermissionSubMenu menu=lm.getPermissionMenu().getListPermissionSubMenu().get(i);
				
				if(menu.getListPermissionSubMenu()!=null){
					//PermissionSubMenu subMenu:menu.getListPermissionSubMenu()
					for(PermissionSubMenu subMenu:menu.getListPermissionSubMenu()){
						
							if(subMenu!=null && ids.indexOf(subMenu.getId())!=-1){
								subMenu.setRemark("check");
							}
							subListMenu.add(subMenu);//添加二级菜单	
					}
				}
				
				if(menu!=null && ids.indexOf(menu.getId())!=-1){
					menu.setRemark("check");
				}
				superListMenu.add(menu);//添加一级菜单
			}
			
			list.add(lm);//添加父菜单
			
		}
		return list;
	}
	
	//获取当前菜单有哪些角色
	public String getRoleMenuId(List<PermissionMenu> listpm){
		if(listpm==null)return null;
		StringBuffer id=new StringBuffer();
		
		for(PermissionMenu permissionMenu:listpm){
			
			for(PermissionSubMenu menu:permissionMenu.getListPermissionSubMenu()){
				if(menu!=null)
					id.append(menu.getId()+",");
				
					for(PermissionSubMenu subMenu:menu.getListPermissionSubMenu()){
						if(subMenu!=null)
							id.append(subMenu.getId()+",");
					}
				
			}
		}
		
		return id.toString();
	}
	
	
	/**
	 * 删除与批量删除
	 * 
	 * @param id
	 * @param ids
	 * @return
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(
			@RequestParam(value = "id", defaultValue = "0") String id,
			@RequestParam(value = "ids", defaultValue = "0") String ids) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/schoolPermissionRole/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				System.out.println("ID删除");
				UserRole u = userRoleService.findOneById(id, UserRole.class);
				userRoleService.remove(u);

			} else if (!ids.isEmpty() && !ids.equals("0")) {
				// 批量删除
				System.out.println("批量删除");
				String[] idsStr = ids.split(",");
				for (String galleryIds : idsStr) {
					UserRole u = userRoleService.findOneById(galleryIds,UserRole.class);
					userRoleService.remove(u);
				}
			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}
		return modelAndView;
	}
	


	/**
	 * 添加与更新 (部门信息)
	 * 
	 
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(String id,String schoolId,
			String name,String remark,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/schoolPermissionRole/list");
		try {
			//
			UserRole ur = null;
			School ss=(School) session.getAttribute("SSchool");//session 中的学校信息
			if (id == null && id!="") {// 添加信息
				ur = new UserRole();// 如果为空，初始化对象
				ur.setName(name);
				ur.setRemark(remark);
				ur.setSchoolId(schoolId);
				this.userRoleService.insert(ur);//添加记录
			} else {// 更新信息
				ur = userRoleService.findOneById(id,UserRole.class);// 查找到当前记录.
				if (ur == null)
					ur= new UserRole();// 如果为空，初始化对象
				ur.setName(name);
				ur.setRemark(remark);
				ur.setSchoolId(schoolId);
				userRoleService.save(ur);//添加记录
			}

		} catch (Exception e) {
			log.info(e.toString());
		}// 添加记录
		return modelAndView;
	}

	
	
	

	
	
	
	//加载菜单
		public LayerMenu loadMenu(String roleName){
			
			if(roleName.equals("FuShang-School")){
				//更新网站菜单
				List<PermissionMenu> listpermissionMenu =this.permissionMenuService.find(super.craeteQueryWhere("menuName","福山外语节"), PermissionMenu.class);
				
				LayerMenu layerMenu=new LayerMenu();
				Query query = super.craeteQueryWhere("roleName", roleName);
				PermissionRole permissionRole = permissionRoleService.findOneByQuery(query, PermissionRole.class);
				permissionRole.setRoleName("FuShang-School");
				permissionRole.setRemark("福山－外语节");
				permissionRole.setListMenu(listpermissionMenu);
				permissionRoleService.save(permissionRole);
				if(permissionRole!=null){
					layerMenu.setName(roleName);
					layerMenu.setPermissionMenu(permissionRole.getListMenu().get(0));//每一个，也只有一个
					return layerMenu;
				}
			}else{
				LayerMenu layerMenu=new LayerMenu();
				Query query = super.craeteQueryWhere("roleName", roleName);
				PermissionRole PermissionRole = permissionRoleService.findOneByQuery(query, PermissionRole.class);
				log.info(PermissionRole.toString());
				if(PermissionRole!=null){
					layerMenu.setName(roleName);
					layerMenu.setPermissionMenu(PermissionRole.getListMenu().get(0));//每一个，也只有一个
					return layerMenu;
				}
			}
			
			
			return null;
		}
	
}
