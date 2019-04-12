package com.cored.school.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.framework.util.ExcelReadUtil;
import com.cored.framework.util.Pagination;
import com.cored.school.pojo.Classes;
import com.cored.school.pojo.Department;
import com.cored.school.pojo.School;
import com.cored.school.pojo.Teacher;
import com.cored.school.pojo.User;
import com.cored.school.service.ClassesService;
import com.cored.school.service.DepartmentService;
import com.cored.school.service.TeacherService;
import com.cored.school.service.UserService;
import com.cored.school.util.FileOperateUtil;

@Controller
@RequestMapping("/teacher")
public class TeacherAction extends GeneralAction<Teacher> {
	private static final Logger log = LoggerFactory
			.getLogger(TeacherAction.class);

	@Autowired
	private TeacherService teacherService; // 老师
	@Autowired
	private DepartmentService departmentService;// 部门
	@Autowired
	private ClassesService classesService;// 班级
	@Autowired
	private UserService userService;//用户登录表

	@RequestMapping("/list")
	public ModelAndView findlist(
			@RequestParam(value = "pid", defaultValue = "0") String pid,
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/teacher/list");
		log.info("老师分页数据加载");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		try {
			//查找所有的
			modelAndView.addObject("pageList",
					this.teacherService.find(super.getQueryForSchool("schoolId", user.getSchoolId()), Teacher.class));
		} catch (Exception e) {
			e.printStackTrace();
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
		modelAndView.setViewName("redirect:/teacher/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				//删除老师时，同时删除老师对应的用户登录信息，
				//删除老师所带班级。
				//删除老师所任课信息
				Teacher c = teacherService.findOneById(id,Teacher.class);
				teacherService.remove(c);
				//删除用户信息
				//TODO
				//清空所带班级信息
				if(c.getClasseTeach()!=null){
					//清空
				Classes classes=this.classesService.findOneById(c.getClasseTeach().getId(),Classes.class);//查找出当前所带的班级信息
				classes.setTeacherDirector(null);
				this.classesService.save(classes);//班新级信息
				}
			} else if (!ids.isEmpty() && !ids.equals("0")) {
				// 批量删除
				String[] idsStr = ids.split(",");
				for (String galleryIds : idsStr) {
					Teacher c = teacherService.findOneById(galleryIds,Teacher.class);
					teacherService.remove(c);
					//删除用户信息
					//TODO
					//清空所带班级信息
					if(c.getClasseTeach()!=null){
						//清空
					Classes classes=this.classesService.findOneById(c.getClasseTeach().getId(),Classes.class);//查找出当前所带的班级信息
					classes.setTeacherDirector(null);
					this.classesService.save(classes);//班新级信息
				}
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}

	

	/**
	 * 添加与更新 (部门信息)
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(String id, String teachernum,
			String name, String birthDate, String sex, String email,
			String telPhone, String address, String cardId, String entryTime,
			String department, String classeTeach, String remark,
			HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/teacher/list");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		String teacherid="";//将此ID保存到用户表中，达到用户表可以返向查找的功能
		try {
			//
			Teacher t = null;
			Classes classes = this.classesService.findOneById(classeTeach,Classes.class);
			if (id ==null || id.equals("")) {// 添加信息
				t = new Teacher();
				t.setTeachernum(teachernum);
				t.setName(name);
				t.setBirthDate(birthDate);
				t.setSex(sex);
				t.setEmail(email);
				t.setTelPhone(telPhone);
				t.setCardId(cardId);
				t.setEntryTime(entryTime);
				t.setDepartment(department);
				t.setClasseTeach(this.classesService.findOneById(classeTeach,Classes.class));// 所带班级信息
				t.setRemark(remark);
				t.setSchoolId(user.getSchoolId());
				t.setAddress(address);
				Long idForUser=new Date().getTime();
				t.setIdForUser(idForUser);
				teacherService.insert(t);// 添加记录
				//查找出刚刚添加的ID信息。
//				Teacher queryTeacher=this.teacherService.findByName(name,
//						schoolId);
//				if(queryTeacher!=null)
//					teacherid=queryTeacher.getId();
//				else
//					log.error("添加老师信息后未查询出刚刚添加的数据");

			} else {// 更新信息
				t = teacherService.findOneById(id,Teacher.class);// 查找到当前记录.
				
				t.setTeachernum(teachernum);
				
				
				t.setName(name);
				t.setBirthDate(birthDate);
				t.setSex(sex);
				t.setEmail(email);
				t.setTelPhone(telPhone);
				t.setCardId(cardId);
				t.setEntryTime(entryTime);
				t.setDepartment(department);
				
				t.setRemark(remark);
				t.setSchoolId(user.getSchoolId());
				t.setAddress(address);
				Long idForUser=new Date().getTime();
				t.setIdForUser(idForUser);
				
				teacherService.save(t);// 更新数据信息
				teacherid=id;//teacherid；
			}
			
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}// 添加记录
		return modelAndView;
	}

	/**
	 * 检查名字是否已经存在
	 */
	@RequestMapping(value = "ajaxCheckName", method = RequestMethod.POST)
	public void ajaxCheckIsName(String name, PrintWriter printWriter,
			HttpSession session) {
		log.info("检查的老师名是："+name);
		if (name != null) {
			try {
				School sessionSchool = (School) session.getAttribute("SSchool");// session
																				// 中的学校信息
				Query queryTeacher=this.craeteQueryWhere("name",name,"schoolid",sessionSchool.getId().trim());
				Teacher teacher = this.teacherService.findOneByQuery(queryTeacher,Teacher.class);
				if (teacher != null)
					printWriter.write("true");
				else
					printWriter.write("false");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		printWriter.flush();
		printWriter.close();
	}
	
	/**
	 * 检查编号
	 */
	@RequestMapping(value = "ajaxCheckIsIds", method = RequestMethod.POST)
	public void ajaxCheckIsIds(String ids, PrintWriter printWriter,
			HttpSession session) {
		log.info("检查的老师名编号是："+ids);
		if (ids != null) {
			try {
				School ss = (School) session.getAttribute("SSchool");// session
				Query query=this.craeteQueryWhere("teachernum",ids,"schoolid",ss.getId());
				Teacher teacher = this.teacherService.findOneByQuery(query,Teacher.class);
				if (teacher != null)
					printWriter.write("true");
				else
					printWriter.write("false");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		printWriter.flush();
		printWriter.close();
	}
	
	
	
	/**
	 * 以班级编号，获取班级ID.
	 * @param list
	 * @param num
	 * @return
	 */
	public Classes paramClassesNnuGetClassesid(List<Classes> list,String num){
		for(Classes c:list){
			if(c.getClassesnum().equals(num)){
				return c;
			}
		}
		return null;
		
	}
	
	/**
	 * 以部门编号，获取部门ID.
	 * @param list
	 * @param num
	 * @return
	 */
	public String paramDempartNnuGetDempartid(List<Department> list,String num){
		for(Department d:list){
			if(d.getDepartmentNum().equals(num)){
				return d.getId();
			}
		}
		return null;
		
	}
	
	/***
	 * 文件上传 老师文件上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
	//@SuppressWarnings({ "static-access", "unused" })
	//@RequestMapping(value = "uploadTeacher")  
//    public ModelAndView uploadStudent(HttpServletRequest request,HttpSession session,RedirectAttributes attr) throws Exception { 
//		School ss=(School) session.getAttribute("SSchool");
//		//获取到当前学校所有的班级
//		Query queryClasses=this.craeteQueryWhere("schoolId",ss.getId());
//		List<Classes> listClasses=this.classesService.find(queryClasses,Classes.class);
//		//获取学校的部门信息
//		Query queryDempart=this.craeteQueryWhere("schoolId",ss.getId());
//		List<Department> listDepartment=this.departmentService.find(queryDempart,Department.class);
//		
//		
//		//Excle 对象
//		FileOperateUtil f=new FileOperateUtil();
//		ExcelReadUtil ex=new ExcelReadUtil();
//		
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/teacher/list");
//		String errorMessage="";//错误信息
//        try{
//		Map<String, Object> map = new HashMap<String, Object>();  
//        // 别名  
//        String[] alaises = ServletRequestUtils.getStringParameters(request,  
//                "uploadTeacher");  
//        String upname="WEB-INF/app-school/temploat/upload";
//  
//        String[] params = new String[] { "uploadTeacher" };  
//        Map<String, Object[]> values = new HashMap<String, Object[]>();  
//        values.put("upload", alaises); 
//        //可以上传的文件格式
//        String filetype[]={"xls,xlsx"};
//        List<Map<String, Object>> result = FileOperateUtil.upload(request,  
//                params, values,upname,filetype);  
//        boolean has= (Boolean) result.get(0).get("hassuffix");
//        if(has!=false){
//          	//获得上传的xls文件路径
//            String path=(String) result.get(0).get("path");
//            	File file=new File(path);
//            	
//     	       String[][] resultexcel;
//     	       resultexcel = ex.readExcel(file, 1);
//     		       int rowLength = resultexcel.length;
//     		       log.info("Excle length："+rowLength);
//     		       for(int i=0;i<rowLength;i++) {
//     		    	   int j=0;
//     		    	   try{
////     		    		   //Excle 数据对象，顺序依次排列，不能换位。
//     		    		   Teacher t=new Teacher();
//     		    		   t.setSchoolId(ss.getId());
//     		    		   t.setTeachernum(resultexcel[i][j++]);//老师编号
//     		    		   t.setName(resultexcel[i][j++]);//姓名 
//     		    		   t.setSex(resultexcel[i][j++]);//性 别
//     		    		   t.setBirthDate(resultexcel[i][j++]);//出生日期
//     		    		   t.setCardId(resultexcel[i][j++]);//身证证
//     		    		   t.setEmail(resultexcel[i][j++]);//email
//     		    		   t.setTelPhone(resultexcel[i][j++]);//电话
//     		    		   t.setEntryTime(resultexcel[i][j++]);//入职时间
//     		    		   t.setDepartment(paramDempartNnuGetDempartid(listDepartment,resultexcel[i][j++]));//部门编号，需要处理。
//     		    		   Classes c=paramClassesNnuGetClassesid(listClasses,resultexcel[i][j++]);
//     		    		   if(c!=null){
//     		    			  t.setClasseTeach(c);//所带班级
//     		    		   }else{
//     		    			   t.setClasseTeach(null);
//     		    		   }
//     		    		   t.setAddress(resultexcel[i][j++]);//地址
//     		    		   t.setRemark(resultexcel[i][j++]);//备注
//     		    		   
//     		    		   this.teacherService.save(t);//保存老师信息。
//     		    		   //将刚添加的老师信息，查询出来。
////     						Teacher queryTeacher=this.teacherService.findByName(t.getName(),
////     								ss.getId());
//     						
//     		    		   //更新所带班级信息
//     		    		   if(c!=null){
////     		    			   c.setTeacherDirector(queryTeacher);
////     		    			   this.classesService.save(c);//更新班级所带班级信息。
//     		    		   }
//     		    		   
//     		    		//添加或更新老师的帐号信息
////     		  			log.info("老师id是："+queryTeacher.getId());
////     		  			this.teacherService.addTeacherUser(queryTeacher.getTeachernum(),
////     		  					queryTeacher.getTelPhone(), ss.getId(),queryTeacher.getId(),session);
//     		    		   
//     		              log.info("--------------");
//    		              	//捕捉批量导入过程中遇到的错误，记录错误行数继续执行下去
//     		              }catch(Exception e){
//     		            	 log.debug("导入文件过程中出现错误第"+(i+2)+"行出现错误"+e.toString());
//     		            	String aa=e.getLocalizedMessage();
//     		            	String b=aa.substring(aa.indexOf(":")+1,aa.length()).replaceAll("\"", "");
//     		            	 
//     		            	errorMessage+="导入文件过程中出现错误第<b>&nbsp&nbsp"+(i+2)+"&nbsp&nbsp</b>行出现错误内容为<b>&nbsp&nbsp"+b+"&nbsp&nbsp</b></br>";
//     		            	 if((i+1)<rowLength){
//     		            		 continue;
//     		            	 }
//     		            	
//     		              }
//     		    		attr.addFlashAttribute("error",errorMessage);
//     		       		}
//          //  map.put("result", result);  
//           return new ModelAndView("redirect:/teacher/list"); 
//     		     //  return modelAndView;
//        }
//        }catch(Exception e){
//        	modelAndView.addObject("error", e);
//        	 return new ModelAndView("redirect:/teacher/list"); 
//        }
//        return modelAndView;
//    }  
	

}
