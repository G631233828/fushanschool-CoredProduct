//package com.cored.school.action;
//
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.app.framework.action.GeneralAction;
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
//import com.cored.permission.service.PermissionMenuService;
//import com.cored.school.pojo.Classes;
//import com.cored.school.pojo.Department;
//import com.cored.school.pojo.School;
//import com.cored.school.pojo.School.SchoolState;
//import com.cored.school.pojo.Student;
//import com.cored.school.pojo.Teacher;
//import com.cored.school.pojo.User;
//import com.cored.school.pojo.base.BaseNatrueid;
//import com.cored.school.service.BaseNatrueidService;
//import com.cored.school.service.ClassesService;
//import com.cored.school.service.DepartmentService;
//import com.cored.school.service.SchoolService;
//import com.cored.school.service.StudentService;
//import com.cored.school.service.TeacherService;
//import com.cored.school.service.UserService;
//import com.cored.school.util.FileOperateUtil;
//
///**
// * 学校信息.
// * @author mac
// *
// */
//@Controller
//@RequestMapping("/school")
//public class SchoolAction extends GeneralAction<School> {
//	private static final Logger log = LoggerFactory
//			.getLogger(SchoolAction.class);
//
//	@Autowired
//	private SchoolService schoolService;// 学校基本信息
//	@Autowired
//	private BaseNatrueidService baseNatrueidService;// 学校性质
//	@Autowired
//	private PermissionMenuService permissionMenuService;//产品中心
//	
//	@Autowired
//	private DepartmentService departmentService;//部门
//	@Autowired
//	private ClassesService classesService;//班级信息
//	@Autowired
//	private TeacherService teacherService;//学校老师
//	@Autowired
//	private StudentService studentService;//学生
//	@Autowired
//	private UserService userService;//用户信息
//	
//	
//
//	@RequestMapping("/list")
//	public ModelAndView findlist(
//			@RequestParam(value = "pid", defaultValue = "0") String pid,
//			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
//			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("app-school/school/list");
//		System.out.println("查看学校基本信息");
//		try {
//			// 分页查询数据
//			Pagination<School> pagination = schoolService
//					.findPaginationByQuery(new Query(), pageNo, pageSize);
//			if (pagination == null)
//				pagination = new Pagination<School>();
//			modelAndView.addObject("pageList", pagination);
//			System.out.println(pagination.toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return modelAndView;// 返回到学校信息
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
//		modelAndView.setViewName("redirect:/school/list");
//		try {
//			if (!id.isEmpty() && !id.equals("0")) {// 删除
//				System.out.println("ID删除");
//				School s = schoolService.findByid(id);
//				SchoolTheRelevantMessage(id);
//				schoolService.remove(s);
//				
//
//			} else if (!ids.isEmpty() && !ids.equals("0")) {
//				// 批量删除
//				System.out.println("批量删除");
//				String[] idsStr = ids.split(",");
//				for (String galleryIds : idsStr) {
//					School s = schoolService.findByid(galleryIds);
//					SchoolTheRelevantMessage(galleryIds);
//					schoolService.remove(s);
//					
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return modelAndView;
//	}
//	
//	//删除学校有关的所有信息，将无法找回(部门，班级，学生，老师，用户)
//	public void SchoolTheRelevantMessage(String schoolid){
//		log.info("学校的ID:"+schoolid);
//		try {
//			List<Department> d=this.departmentService.find(super.craeteQueryWhere("schoolId",schoolid));//删除部门
//			List<Classes> c=this.classesService.find(super.craeteQueryWhere("schoolId",schoolid));//删除班级
//			List<Teacher> t=this.teacherService.find(super.craeteQueryWhere("schoolid",schoolid));//删除老师
//			List<Student> s=this.studentService.find(super.craeteQueryWhere("schoolId",schoolid));//删除学生
//			List<User> u=this.userService.find(super.craeteQueryWhere("schoolid",schoolid));//删除用户名；
//			
//			for(Department remove : d ){
//				this.departmentService.remove(remove);
//			}
//			for(Classes remove : c ){
//				this.classesService.remove(remove);
//			}
//			for(Teacher remove : t ){
//				this.teacherService.remove(remove);
//			}
//			for(Student remove : s ){
//				this.studentService.remove(remove);
//			}
//			for(User remove : u ){
//				this.userService.remove(remove);
//			}
//			
//			log.info("删除学校所有信息成功");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//
//	/**
//	 * 跳转到(添加与更新)页面
//	 * 
//	 * @return
//	 */
//	@RequestMapping("/updateOrCreate")
//	public ModelAndView updateOrCreate(
//			@RequestParam(value = "id", defaultValue = "0") String id) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("app-school/school/editor");
//		School school = null;
//		try {
//			// 查找学校性质。
//			modelAndView.addObject("listBaseNatrueid", baseNatrueidService.findByAll());
//			//加载产品中心所有的产品,让学校选择有哪些产品
//			
//			modelAndView.addObject("listProduct", this.permissionMenuService.findByAll());
//			if (!id.equals("0")) {// 修改
//
//				System.out.println("id:" + id);
//				school = schoolService.findByid(id);
//
//				if (infoForm == null)
//					infoForm = new School();
//			} else {// 新增
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}// 以ID查找当前用户信息
//		modelAndView.addObject("school", school);
//
//		return modelAndView;
//
//	}
//
//	/**
//	 * 添加与更新 (学校信息)
//	 * 
//	 * @param id
//	 * @param name
//	 * @param englishName
//	 * @param shorts
//	 * @param address
//	 * @param telPhone
//	 * @param email
//	 * @param remark
//	 * @param schoolCreateTime
//	 * @param natrueid
//	 * @param coredIds
//	 * @param area
//	 * @param ipAddress
//	 * @param port
//	 * @return
//	 */
//	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
//	public ModelAndView createOrUpdateToFind(String id, String name,
//			String englishName, String shorts, String address, String telPhone,
//			String email, String remark, String schoolCreateTime,
//			String natrueid, String coredIds, String area, String ipAddress,
//			String port, String state,String schoolproduct,String username,String password) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/school/list");
//		School saveSchool=null;
//		try {
//			//
//			//SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			School school = null;
//			if (id == null) {// 添加学校信息
//				school = new School();
//				school.setName(name);
//				school.setEnglishName(englishName);
//				school.setShorts(shorts);
//				school.setAddress(address);
//				school.setTelPhone(telPhone);
//				school.setEmail(email);
//				school.setRemark(remark);
//				school.setSchoolCreateTime(schoolCreateTime);
//				BaseNatrueid baseNatrueid = baseNatrueidService
//						.findByid(natrueid);
//				school.setNatrueid(baseNatrueid);// 学校性质
//				school.setCoredIds(coredIds);//学校编号
//				school.setArea(area);
//				school.setIpAddress(ipAddress);
//				school.setPort(port);
//				if (state.equals("normalRun"))
//					school.setState(SchoolState.normalRun);// 状态
//				else
//					school.setState(SchoolState.stopRun);
//				
//				school.setSchoolproduct(schoolproduct);
//				schoolService.insert(school);
//				
//				//保存成功后，查询出当前添加的用户信息
//				saveSchool=this.schoolService.findByName(name);
//				
//				
//				
//				
//			}else {// 更新学校信息
//				school = schoolService.findByid(id);// 查找到当前记录.
//				if (school == null)
//					school = new School();// 如果为空，初始化对象
//				school.setName(name);
//				school.setEnglishName(englishName);
//				school.setShorts(shorts);
//				school.setAddress(address);
//				school.setTelPhone(telPhone);
//				school.setEmail(email);
//				school.setRemark(remark);
//				school.setSchoolCreateTime(schoolCreateTime);
//				BaseNatrueid baseNatrueid = baseNatrueidService
//						.findByid(natrueid);
//				school.setNatrueid(baseNatrueid);// 学校性质
//				school.setCoredIds(coredIds);
//				school.setArea(area);
//				school.setIpAddress(ipAddress);
//				school.setPort(port);
//				if (state.equals("normalRun"))
//					school.setState(SchoolState.normalRun);// 状态
//				else
//					school.setState(SchoolState.stopRun);
//				
//				//保存学校产品
//				school.setSchoolproduct(schoolproduct);
//				schoolService.save(school);// 更新数据信息
//				
//
//				//保存成功后，查询出当前添加的用户信息
//				saveSchool=this.schoolService.findByName(name);
//			}
//			
//			//保存用户信息
//			//帐号,密码,学校信息,产品。
//			//log.info("学校ID"+saveSchool.getId());
//			//System.out.println("学校ID"+saveSchool.getId());
//			User user =this.schoolService.addSchoolUser(username,password, saveSchool, schoolproduct);
//			//再次的更新学校信息
//			saveSchool.setUser(user);
//			
//			
//			//为当前学校添加功能菜单。
//			
//			
//			
//			this.schoolService.save(saveSchool);//保存用户信息到学校信息表.
//		} catch (Exception e) {
//			e.printStackTrace();
//		}// 添加记录
//		return modelAndView;
//	}
//	
//	
//	
//	/**
//	 * 检查名字是否已经存在
//	 */
//	@RequestMapping(value = "ajaxCheckName", method = RequestMethod.POST)
//	public void ajaxCheckIsName(String name, PrintWriter printWriter,
//			HttpSession session) {
//		log.info("检查学校名是否已经存在："+name);
//		if (name != null) {
//			try {
//				School school=this.schoolService.findByName(name);
//				if (school != null)
//					printWriter.write("true");
//				else
//					printWriter.write("false");
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//
//		printWriter.flush();
//		printWriter.close();
//	}
//	
//	
//	/**
//	 * 检查学校编号是否已经存在
//	 */
//	@RequestMapping(value = "ajaxCheckCoredIds", method = RequestMethod.POST)
//	public void ajaxCheckIsCoredIds(String coredIds, PrintWriter printWriter,
//			HttpSession session) {
//		log.info("检查学校编号是否已经存在："+coredIds);
//		if (coredIds != null) {
//			try {
//				Query queryids=this.craeteQueryWhere("coredIds",coredIds);
//				Integer school=this.schoolService.findCountByQuery(queryids);
//				if (school != null && school>0)
//					printWriter.write("true");//有数据
//				else
//					printWriter.write("false");//没有数据
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//
//		printWriter.flush();
//		printWriter.close();
//	}
//	
//	
//
//	/**
//	 * 文件下载
//	 * @param request
//	 * @param response
//	 * @return
//	 * @throws Exception
//	 */
//    @RequestMapping(value = "download")  
//    public ModelAndView download(HttpServletRequest request,  
//            HttpServletResponse response,String downloadType) throws Exception { 
//    	  String storeName="";
//    	if(downloadType.equals("student")){
//    		storeName  = "studentTemplate.xls";  
//    	}else if (downloadType.equals("teacher")){
//    		storeName = "teacherTemplate.xls";  
//    	}
//     
//        String contentType = "application/octet-stream";  
//        String UPLOAD="WEB-INF/app-school/template/download/";
//        FileOperateUtil.download(request, response, storeName, contentType,UPLOAD);  
//  
//        return null;  
//    }  
//
//}
