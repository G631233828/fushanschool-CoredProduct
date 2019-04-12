package com.cored.school.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
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
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;
import com.cored.school.pojo.School;
import com.cored.school.pojo.User;
import com.cored.school.pojo.User.userType;
import com.cored.school.pojo.UserRole;
import com.cored.school.service.ClassesService;
import com.cored.school.service.DepartmentService;
import com.cored.school.service.SchoolService;
import com.cored.school.service.StudentService;
import com.cored.school.service.TeacherService;
import com.cored.school.service.UserLogService;
import com.cored.school.service.UserRoleService;
import com.cored.school.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction extends GeneralAction<User> {
	private static final Logger log = LoggerFactory
			.getLogger(UserAction.class);

	@Autowired
	private UserService userService;//用户信息
	@Autowired
	private PermissionRoleService permissionRoleService;//角色信息
	@Autowired
	private PermissionMenuService permissionMenuService;//系统菜单，超级管理登录时加载。
	
	
	@Autowired
	private SchoolService schoolService;//学校信息
	@Autowired
	private TeacherService teacherService;//Teacher信息
	@Autowired
	private DepartmentService departmentService;//部门信息
	@Autowired
	private StudentService studentService;//学生信息
	@Autowired
	private UserLogService userLogService;//用户（重要）日志
	@Autowired
	private ClassesService classesService;
	
	@Autowired
	private UserRoleService userRoleService;//用户角色管理
	
	/**
	 * 访问登陆页面
	 * @return
	 */
	@RequestMapping("/profile")
	public ModelAndView profile(HttpSession session
			) {
		System.out.println("profile");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/profile");//登录成功
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		//获取用户信息的id .加载用户信息
		modelAndView.addObject("user", this.userService.findOneById(user.getId(), User.class));
		
		//加载用户角色
		List<UserRole> listRole=this.userRoleService.find(super.getQueryForSchool("schoolId", user.getSchoolId()), UserRole.class);
		modelAndView.addObject("listRole", listRole);
		
		
		return modelAndView;//个人资料
	}
	
	
	
	/**
	 * 访问登陆页面
	 * @return
	 */
	@RequestMapping("/updatePorfile")
	public ModelAndView updatePorfile(HttpSession session,String name,String card,String id) {
		System.out.println("updatePorfile");
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.setViewName("redirect:/user/profile");//跳转到porfile
		User user=this.userService.findOneById(id, User.class);//查找用户
		if(!user.getName().equals(name) || !user.getCard().equals(card)){
			user.setName(name);
			user.setCard(card);
			this.userService.save(user);
		}
		
		return modelAndView;//个人资料
	}
	
	/**
	 * 修改密码
	 * @return
	 */
	@RequestMapping("/updatePassword")
	public ModelAndView updatePassword(String id,String password,String passwordNew) {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("updatePassword");
		User user=this.userService.findOneById(id, User.class);//查找用户
		if(user!=null){
			if(password.equals(user.getPassword())){//用户密码相等，时修改密码
				user.setPassword(passwordNew);
				this.userService.save(user);//更新密码
				modelAndView.setViewName("redirect:/user/loginout");//
				return modelAndView;
			}
		}
		//登录成功
		modelAndView.setViewName("admin/profile");
		return modelAndView;//个人资料
	}
	
	
	
	/**
	 * 访问登陆页面
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView loginView(HttpSession session) {
		log.info("login");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//用户登录成功的session.
		ModelAndView modelAndView = new ModelAndView();
		if(user!=null){
			modelAndView.setViewName("redirect:/user/index");//登录成功
		}else{
			modelAndView.setViewName("admin/login");//登录成功
		}
		
		return modelAndView;//返回登录页面
	}
	
	/**
	 * 用户登录.验证。
	 * @return
	 */
	@RequestMapping(value = "/loginToIndex",method = RequestMethod.POST)
	public ModelAndView loginToIndex(String username, String password, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		
		log.info("用户登录");
		try {
			Query query=super.craeteQueryWhere("username",username.trim(),"password",password.trim());
			User user=this.userService.findOneByQuery(query, User.class);//用户登录
			if(user==null){
				modelAndView.setViewName("redirect:/user/login");//返回登录界面
				log.info("登录失败");
			}else{
				//保存到session 中
				session.setAttribute(CommonEnum.LOGINUSER, user);//将用户对象保存到session中
				modelAndView.setViewName("redirect:/user/index");//登录成功
			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
			modelAndView.setViewName("errorpage/error");
		}
		return modelAndView;
	}
	
	/**
	 * 访问首页页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/index")
	public ModelAndView indexView(HttpSession session) throws Exception {
		System.out.println("login success");
		
		ModelAndView modelAndView = new ModelAndView();
		
		//用户登录—
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//用户登录成功的session.
		PermissionMenu permissionMenu=null;//权限功能
		//后台权限管理
		if(user.getType().equals(userType.superManager)){//超级管理员权限
			//加载后台权限菜单,（菜单表）
			Query query=super.craeteQueryWhere("menuName","校园办公");//查找管理后台菜单
			permissionMenu=permissionMenuService.findOneByQuery(query,PermissionMenu.class);
			
		}else if(user.getType().equals(userType.teacherUser)){
			//加载用户权限菜单 （UserRole）
			UserRole userRole=this.userRoleService.findOneById(user.getRole(), UserRole.class);//加载用户角色菜单
			if(userRole!=null)
				permissionMenu=userRole.getPermissionMenu().get(0);
		}else if(user.getType().equals(userType.otheruser)){
			//otherUser 用户登录成功后跳转到网站首页，因为他们不需要登录后台
			modelAndView.setViewName("redirect:../web/index");
			return modelAndView;
		}
		
		modelAndView.setViewName("admin/index");
		log.info("权限菜单功能："+permissionMenu.toString());
		//加载登录用户的角色。
		session.setAttribute("roleMenu",permissionMenu);//加载用户角色
		return modelAndView;//返回登录页面
	}
	
	
	
	@RequestMapping("/list")
	public ModelAndView findlist(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/user/list");
		System.out.println("查询用户所有信息");
		try {
			// 分页查询数据
			//查询学校所有老师信息
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			modelAndView.addObject("pageList", userService.find(super.getQueryForSchool("schoolId", user.getSchoolId()),User.class));
			
			
			//加载用户角色
			List<UserRole> listRole=this.userRoleService.find(super.getQueryForSchool("schoolId", user.getSchoolId()), UserRole.class);
			modelAndView.addObject("listRole", listRole);
			
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}
		return modelAndView;// 返回到学校信息
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
		modelAndView.setViewName("redirect:/user/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				System.out.println("ID删除");
				User u = userService.findOneById(id, User.class);
				userService.remove(u);

			} else if (!ids.isEmpty() && !ids.equals("0")) {
				// 批量删除
				System.out.println("批量删除");
				String[] idsStr = ids.split(",");
				for (String galleryIds : idsStr) {
					User u = userService.findOneById(galleryIds,User.class);
					userService.remove(u);
				}
			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}
		return modelAndView;
	}
	
	/**
	 * 跳转到(添加与更新)页面
	 * 
	 * @return
	 */
	@RequestMapping("/updateOrCreate")
	public ModelAndView updateOrCreate(
			@RequestParam(value = "id", defaultValue = "0") String id,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("app-school/user/editor");
		User u = null;
		try {
			School sessionSchool=(School) session.getAttribute("SSchool");//session 中的学校信息
			//查找当前学校下的所有角色.
			Query query =new Query();
			query.addCriteria(Criteria.where("schoolForId").is(sessionSchool.getId()));
			List<PermissionRole> roleList=permissionRoleService.find(query,PermissionRole.class);
			if(roleList==null)roleList=new ArrayList<PermissionRole>();
			modelAndView.addObject("roleList", roleList);
			if (!id.equals("0")) {// 修改

				System.out.println("id:" + id);
				u = userService.findOneById(id,User.class);

				if (infoForm == null)
					infoForm = new User();
			} else {// 新增

			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}// 以ID查找当前用户信息
		
	
		
		modelAndView.addObject("user", u);

		return modelAndView;

	}

	/**
	 * 添加与更新 
	 * 
	 
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(String id,
			String username,String role,String name,String card,
			String password, String headImage, String remark,
			String type,String teacherIdOrStudentId,String schoolid,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/list");
		try {
			//
			User u = null;
			//PermissionRole PRole=permissionRoleService.findOneById(role);//加载用户角色
			School ss=(School) session.getAttribute("SSchool");//session 中的学校信息
			//以角色ID,查找学校id
			if (id == null || id=="") {// 添加信息
				u = new User();// 如果为空，初始化对象
				u.setUsername(username);
				u.setPassword(password);
				u.setHeadImage(headImage);
				u.setRemark(remark);
				u.setCard(card);
				u.setName(name);
				u.setType(userType.teacherUser);
				u.setTeacherIdOrStudentId(teacherIdOrStudentId);
				u.setRole(role);
				u.setSchoolId(schoolid);
				userService.insert(u);//添加记录
			} else {// 更新信息
				u = userService.findOneById(id,User.class);// 查找到当前记录.
				if (u == null)
					u = new User();// 如果为空，初始化对象
				u.setUsername(username);
				u.setPassword(password);
				u.setHeadImage(headImage);
				u.setRemark(remark);
				u.setCard(card);
				u.setName(name);
				
				u.setTeacherIdOrStudentId(teacherIdOrStudentId);
				u.setRole(role);
				u.setSchoolId(schoolid);
				userService.save(u);//添加记录
			}

		} catch (Exception e) {
			e.printStackTrace();
		}// 添加记录
		return modelAndView;
	}
	

	/**
	 * 检查用户名是否已经存在
	 */
	@RequestMapping(value = "ajaxCheckName", method = RequestMethod.POST) 
    public void ajaxCheckIsName(String  name,PrintWriter printWriter,HttpSession session) {
       
    } 
	
	
	

	
	
	
	
	
	
	
	
	
	/** 
	 * 用户登成功后，首页加载信息内容。
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/personMessage")
	public ModelAndView personMessage(HttpSession session,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		//modelAndView.setViewName("app-weChat/admin/index");
		modelAndView.setViewName("index");
		//
		User user=(User) session.getAttribute("SUser");
		Query query =new Query();
		query.addCriteria(Criteria.where("userid").is(user.getId().trim()));
		query.with(new Sort(Sort.Direction.DESC, "order"));//排序
		try {} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	
	/**
	 * 注销登录，返回到登录页面
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "admin/login";//返回登录页面
	}
	
	
	@RequestMapping("/register")
	public String register(HttpSession session,String username,
							String password,String name) {
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setName(name);
		user.setType(userType.otheruser);
		user.setSchoolId("cored");
		
		this.userService.insert(user);
		
		return "admin/login";//返回登录页面
	}
	
	
	
	@RequestMapping("/personalsetting")
	public ModelAndView personalsetting(
			@RequestParam(value = "id", defaultValue = "0") String id,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		
	

		return modelAndView;
	
	
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
}
