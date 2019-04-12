//package com.cored.school.action;
//
//import java.io.PrintWriter;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.app.framework.action.GeneralAction;
//import org.app.framework.pojo.GeneralBean.SchoolRoleType;
//import org.app.framework.util.Pagination;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.mongodb.core.query.Query;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.cored.permission.pojo.PermissionMenu;
//import com.cored.permission.pojo.PermissionRole;
//import com.cored.permission.pojo.PermissionSubMenu;
//import com.cored.permission.service.PermissionRoleService;
//import com.cored.school.pojo.School;
//
///**
// * 学校权限，每一个学校都有自己独立的权限管理。 但这些权限都来自于。产品分给些项目分配置了什么样的权限
// * 
// * @author aaron
// *
// */
//@Controller
//@RequestMapping("/schoolPermissionRole")
//public class SchoolPermissionRoleAction extends GeneralAction<PermissionRole> {
//
//	@Autowired
//	private PermissionRoleService permissionRoleService;// 学校角色菜单
//
//	private static final Logger log = LoggerFactory
//			.getLogger(SchoolPermissionRoleAction.class);
//
//	@RequestMapping("/list")
//	public ModelAndView findlist(
//			@RequestParam(value = "pid", defaultValue = "0") String pid,
//			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
//			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
//			HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("app-school/schoolPermissionRole/list");
//		log.info("加载学校权限");
//		try {
//			School ss = (School) session.getAttribute("SSchool");// session
//																	// 中的学校信息
//			// 分页查询数据
//			Query query = this.craeteQueryWhere("schoolForId", ss.getId());// 添加查询条件
//			Pagination<PermissionRole> pagination = permissionRoleService
//					.findPaginationByQuery(query, pageNo, pageSize);
//			if (pagination == null)
//				pagination = new Pagination<PermissionRole>();
//			modelAndView.addObject("pageList", pagination);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return modelAndView;// 返回到学校信息
//	}
//
//	
//	public PermissionRole  chekRole(PermissionRole trunk, PermissionRole check){
//		
//		String superMenu1 = new String("一级菜单:");
//		// 2.获取二级菜单
//		String superMenu2 = new String("二级菜单:");
//		// 3.获取三级菜单
//		String superMenu3 = new String("三级菜单:");
//
//		for (PermissionMenu pm : check.getListMenu()) {// 获取根目录权限
//			superMenu1=superMenu1+pm.getId()+",";
//			if(pm.getListPermissionSubMenu()!=null){
//				for(PermissionSubMenu pm2:pm.getListPermissionSubMenu()){//二级菜单
//					superMenu2=superMenu2+pm2.getId()+",";
//					if(pm2.getListPermissionSubMenu()!=null){
//						for(PermissionSubMenu pm3:pm2.getListPermissionSubMenu()){//三级菜单
//							superMenu3=superMenu3+pm3.getId()+",";
//						}
//					}
//				}
//			}
//			
//		}
//		log.info("测试TOString1:" + superMenu1.toString());
//		log.info("测试TOString2:" + superMenu2.toString());
//		log.info("测试TOString3:" + superMenu3.toString());
//		
//		PermissionRole retPR=new PermissionRole();
//		retPR.setId(trunk.getId());
//		retPR.setIdForUser(trunk.getIdForUser());
//		retPR.setIsDelete(trunk.getIsDelete());
//		retPR.setRoleName(trunk.getRoleName());
//		retPR.setRemark(trunk.getRemark());
//		retPR.setSchoolForId(trunk.getSchoolForId());
//		retPR.setSchoolRoleType(trunk.getSchoolRoleType());
//		List<PermissionMenu> listpm=new ArrayList<PermissionMenu>();
//			
//			// 动态添加权限
//						for (PermissionMenu pm1 : trunk.getListMenu()) {
//							if (superMenu1.indexOf(pm1.getId()) != -1) {
//								pm1.setRemark("trues");//选择中
//								List<PermissionSubMenu> l2 = new ArrayList<PermissionSubMenu>();
//								System.out.println("检查数据:" + pm1.getListPermissionSubMenu());
//								if (pm1.getListPermissionSubMenu() != null) {
//									for (PermissionSubMenu pm2 : pm1
//											.getListPermissionSubMenu()) {
//										if (superMenu2.indexOf(pm2.getId()) != -1) {
//											pm2.setRemark("trues");//选择中
//											List<PermissionSubMenu> l3 = new ArrayList<PermissionSubMenu>();
//											if (pm2.getListPermissionSubMenu() != null) {
//												for (PermissionSubMenu pm3 : pm2.getListPermissionSubMenu()) {
//													if (superMenu3.indexOf(pm3.getId()) != -1) {
//														pm3.setRemark("trues");//选择中
//													}
//													l3.add(pm3);
//												}
//											}
//											pm2.setListPermissionSubMenu(l3);// 添加三级子菜单
//										}
//										l2.add(pm2);// 添加二级菜单
//									}
//								}
//								pm1.setListPermissionSubMenu(l2);
//							}
//							listpm.add(pm1);//一级菜单
//						}
//						retPR.setListMenu(listpm);
//		System.out.println("check:"+retPR);
//		return retPR;
//	}
//	
//	/**
//	 * 跳转到(添加与更新)页面
//	 * 
//	 * @return
//	 */
//	@RequestMapping("/updateOrCreate")
//	public ModelAndView updateOrCreate(
//			@RequestParam(value = "id", defaultValue = "0") String id,
//			HttpSession session) {
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("app-school/schoolPermissionRole/editor");
//		PermissionRole PR = null;
//		try {
//		// session
//		School ss = (School) session.getAttribute("SSchool");// session
//		// 查找当前学校（管理员）要权限菜单。
//		Query query = this .craeteQueryWhere("schoolForId", ss.getId(), "schoolRoleType", SchoolRoleType.schoolAdminRole.toString());
//		PermissionRole listpr=this.permissionRoleService.findOneByQuery(query);
//	
//	
//			if (!id.equals("0")) {// 修改
//
//				System.out.println("id:" + id);
//				PR = permissionRoleService.findByid(id);
//				if (PR == null)
//					PR = new PermissionRole();
//			//添加算法，获取当前的角色有哪些菜单
//				modelAndView.addObject("listRole",chekRole(listpr,PR));
//			} else {// 新增
//				modelAndView.addObject("listRole",listpr);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}// 以ID查找当前用户信息
//		modelAndView.addObject("PR", PR);
//		return modelAndView;
//
//	}
//
//	/**
//	 * 添加与更新
//	 * 
//	 * 
//	 * @return
//	 */
//	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
//	public ModelAndView createOrUpdateToFind(String id, String name,
//			String remark, String prole, HttpSession session) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/schoolPermissionRole/list");
//		try {
//			log.info("权限：" + prole);
//			School ss = (School) session.getAttribute("SSchool");// session
//			List<PermissionMenu> list = PermissionLoad(prole, ss.getId());
//			if (id == null) {
//				// 添加
//				PermissionRole pr = new PermissionRole();
//				pr.setRoleName(name);
//				pr.setRemark(remark);
//				pr.setListMenu(list);
//				pr.setSchoolForId(ss.getId());
//				pr.setSchoolRoleType(SchoolRoleType.schoolUserRole);
//				pr.setIdForUser(new Date().getTime());
//				this.permissionRoleService.insert(pr);// 添加记录到数据库
//			} else {
//				// 更新
//				PermissionRole pr=this.permissionRoleService.findByid(id);
//				pr.setRoleName(name);
//				pr.setRemark(remark);
//				pr.setListMenu(list);
//				pr.setSchoolForId(ss.getId());
//				pr.setSchoolRoleType(SchoolRoleType.schoolUserRole);
//				pr.setIdForUser(new Date().getTime());
//				this.permissionRoleService.save(pr);// 添加记录到数据库
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}// 添加记录
//		return modelAndView;
//	}
//
//	/**
//	 * 删除与批量删除
//	 * 
//	 * @param id
//	 * @param ids
//	 * @return
//	 */
//	@RequestMapping("/delete")
//	public ModelAndView delete(
//			@RequestParam(value = "id", defaultValue = "0") String id,
//			@RequestParam(value = "ids", defaultValue = "0") String ids) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/schoolPermissionRole/list");
//		try {
//			if (!id.isEmpty() && !id.equals("0")) {// 删除
//				System.out.println("ID删除");
//				PermissionRole pr = permissionRoleService.findByid(id);
//				permissionRoleService.remove(pr);
//
//			} else if (!ids.isEmpty() && !ids.equals("0")) {
//				// 批量删除
//				System.out.println("批量删除");
//				String[] idsStr = ids.split(",");
//				for (String galleryIds : idsStr) {
//					PermissionRole pr = permissionRoleService
//							.findByid(galleryIds);
//					permissionRoleService.remove(pr);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return modelAndView;
//	}
//
//	
//	
//	
//	
//	/**
//	 * 权限处理
//	 * 
//	 * @param prole
//	 * @param schoolid
//	 * @return
//	 */
//	public List<PermissionMenu> PermissionLoad(String prole, String schoolid) {
//		List<PermissionMenu> list = new ArrayList<PermissionMenu>();// 权限菜单
//		Query query = this.craeteQueryWhere("schoolForId", schoolid,// 添加查询条件，角色
//				"schoolRoleType", SchoolRoleType.schoolAdminRole.toString());
//		try {
//			PermissionRole PR = this.permissionRoleService
//					.findOneByQuery(query);// 获取当前管理员有所有权限.
//
//			// 1.获取权限的根菜单
//			String[] tempRole = prole.split(",");// 分解前来传过来的字符串。
//
//			String superMenu = new String("一级菜单:");
//			// 2.获取二级菜单
//			String superMenu2 = new String("二级菜单:");
//			// 3.获取三级菜单
//			String superMenu3 = new String("三级菜单:");
//
//			for (int index = 0; index < tempRole.length; index++) {// 获取根目录权限
//				int lastIndex = tempRole[index].lastIndexOf("－");
//				System.out.println(lastIndex);
//				// 一级菜单
//				if (lastIndex == -1) {
//					superMenu = superMenu + tempRole[index];
//				}
//				// 二级菜单
//				if (lastIndex < 30 && lastIndex != -1) {
//					superMenu2 = superMenu2 + tempRole[index] + ",";
//				}
//				// 三级菜单
//				if (lastIndex > 30) {
//					superMenu3 = superMenu3 + tempRole[index] + ",";
//				}
//			}
//			log.info("测试TOString1:" + superMenu.toString());
//			log.info("测试TOString2:" + superMenu2.toString());
//			log.info("测试TOString3:" + superMenu3.toString());
//
//			// 动态添加权限
//			for (PermissionMenu pm1 : PR.getListMenu()) {
//
//				System.out.println("check一级菜单:"
//						+ pm1.getId().indexOf(superMenu.toString()));
//				System.out.println("check一级菜单:"
//						+ superMenu.equals(pm1.getId().toString()));
//				System.out.println("check一级菜单:"
//						+ superMenu.indexOf(pm1.getId()));
//				System.out.println("一级菜单信息:" + pm1.getId());
//				if (superMenu.indexOf(pm1.getId()) != -1) {
//
//					PermissionMenu cp = new PermissionMenu();
//					cp.setId(pm1.getId());
//					cp.setMenuName(pm1.getMenuName());
//					cp.setMenuUrl(pm1.getMenuUrl());
//					cp.setMenuType(pm1.getMenuType());
//					cp.setOrderby(pm1.getOrderby());
//					List<PermissionSubMenu> l2 = new ArrayList<PermissionSubMenu>();
//					System.out
//							.println("检查数据:" + pm1.getListPermissionSubMenu());
//					if (pm1.getListPermissionSubMenu() != null) {
//						for (PermissionSubMenu pm2 : pm1
//								.getListPermissionSubMenu()) {
//							if (superMenu2.indexOf(pm2.getId()) != -1) {
//								PermissionSubMenu cp2 = new PermissionSubMenu();
//								cp2.setId(pm2.getId());
//								cp2.setMenuName(pm2.getMenuName());
//								cp2.setMenuUrl(pm2.getMenuUrl());
//								cp2.setMenuType(pm2.getMenuType());
//								cp2.setOrderby(pm2.getOrderby());
//								List<PermissionSubMenu> l3 = new ArrayList<PermissionSubMenu>();
//								if (pm2.getListPermissionSubMenu() != null) {
//									for (PermissionSubMenu pm3 : pm2
//											.getListPermissionSubMenu()) {
//										if (superMenu3.indexOf(pm3.getId()) != -1) {
//											PermissionSubMenu cp3 = new PermissionSubMenu();
//											cp3.setId(pm3.getId());
//											cp3.setMenuName(pm3.getMenuName());
//											cp3.setMenuUrl(pm3.getMenuUrl());
//											cp3.setMenuType(pm3.getMenuType());
//											cp3.setOrderby(pm3.getOrderby());
//											l3.add(cp3);
//										}
//									}
//								}
//								cp2.setListPermissionSubMenu(l3);// 添加三级子菜单
//								l2.add(cp2);// 添加二级菜单
//							}
//						}
//					}
//					cp.setListPermissionSubMenu(l2);
//					list.add(cp);
//				}
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		log.info("最终结果：" + list.toString());
//		return list;
//	}
//	
//	
//	
//	
//	
//	/**
//	 * 检查角色名是否已经存在
//	 */
//	@RequestMapping(value = "ajaxCheckName", method = RequestMethod.POST) 
//    public void ajaxCheckName(String  name,PrintWriter printWriter,HttpSession session) { 
//        
//        if(name!=null){
//        	try {
//        	School ss=(School) session.getAttribute("SSchool");//获取学校信息
//        	Integer classes=this.permissionRoleService.findCountByQuery(
//        			super.craeteQueryWhere("schoolForId",ss.getId(),"roleName",name));
//			
//			if (classes != null && classes>0)
//				 printWriter.write("true"); 
//			else
//				printWriter.write("false"); 
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//        }
//       
//        printWriter.flush(); 
//        printWriter.close(); 
//    } 
//
//}
