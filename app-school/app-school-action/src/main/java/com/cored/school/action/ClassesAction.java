package com.cored.school.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.framework.util.Pagination;
import com.cored.school.pojo.Classes;
import com.cored.school.pojo.School;
import com.cored.school.pojo.Teacher;
import com.cored.school.pojo.User;
import com.cored.school.pojo.base.BaseGrade;
import com.cored.school.service.ClassesService;
import com.cored.school.service.TeacherService;

@Controller
@RequestMapping("/classes")
public class ClassesAction extends GeneralAction<Classes> {
	
	private static final Logger log = LoggerFactory
			.getLogger(ClassesAction.class);
	@Autowired
	private ClassesService classesService;//班级信息
	@Autowired
	private TeacherService teacherService;//学校老师
	
	
	@RequestMapping("/list")
	public ModelAndView findlist(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/classes/list");
		log.info("查询班级所有信息");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		try {
			modelAndView.addObject("pageList", 
					this.classesService.find(super.getQueryForSchool("schoolId",user.getSchooldIds()), Classes.class));
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
		modelAndView.setViewName("redirect:/classes/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				log.info("ID删除");
				Classes c = classesService.findOneById(id,Classes.class);
				classesService.remove(c);

			} else if (!ids.isEmpty() && !ids.equals("0")) {
				// 批量删除
				log.info("批量删除");
				String[] idsStr = ids.split(",");
				for (String galleryIds : idsStr) {
					Classes c = classesService.findOneById(galleryIds,Classes.class);
					classesService.remove(c);
				}
			}
		} catch (Exception e) {
			log.info(e.getMessage(),e);
		}
		return modelAndView;
	}
	

	
	public List<Integer> loadSemester(Integer listsize){
		List<Integer> list=new ArrayList<Integer>();
		
		Calendar cal = Calendar.getInstance(); 
		int gradeInt=cal.get(Calendar.YEAR);
		for(int i=0;i<listsize;i++){
			list.add(gradeInt-i-1);
		}
		return list;
	}

	/**
	 * 添加与更新 (部门信息)
	 * 
	 
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(String id, String name,
			String classesnum, Integer yearNumber, Integer personNumber, 
			String teacherDirector,String subTeacherDirector,
			String remark,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/classes/list");
		try {
			//
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			Classes c = null;
			Teacher teacher=this.teacherService.findOneById(user.getSchooldIds(), Teacher.class);
			if (id == null) {// 添加信息
				c = new Classes();
				c.setName(name);
				c.setClassesnum(classesnum);
				c.setYearNumber(yearNumber);
				c.setPersonNumber(personNumber);
				c.setTeacherDirector(this.teacherService.findOneById(teacherDirector,Teacher.class));
				c.setSubTeacherDirector(this.teacherService.findOneById(subTeacherDirector,Teacher.class));
				c.setRemark(remark);
				c.setSchoolId(user.getSchooldIds());
				classesService.insert(c);//添加记录
			} else {// 更新信息
				c = classesService.findOneById(id,Classes.class);// 查找到当前记录.
				if (c == null)
					c = new Classes();// 如果为空，初始化对象
				c.setName(name);
				c.setClassesnum(classesnum);
				c.setYearNumber(yearNumber);
				c.setPersonNumber(personNumber);
				c.setTeacherDirector(this.teacherService.findOneById(teacherDirector,Teacher.class));
				c.setSubTeacherDirector(this.teacherService.findOneById(subTeacherDirector,Teacher.class));
				c.setRemark(remark);
				c.setSchoolId(user.getSchooldIds());
				classesService.save(c);// 更新数据信息
			}
			//更新老师表中，所带班级字段。
			teacher.setClasseTeach(c);//更新老师表中所带班级
			this.teacherService.save(teacher);
			

		} catch (Exception e) {
			e.printStackTrace();
		}// 添加记录
		return modelAndView;
	}
	
	
	@RequestMapping("/unbind")
	public ModelAndView unbind(String id, String type) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/classes/list");
		try {
			//解除班中任绑定和副班主任绑定
			if(id!=null && type!=null){
			Classes classes=this.classesService.findOneById(id,Classes.class);
			if(type.equals("main")){//班中任
				//更新班级表成功后，同时更新老师表
				Teacher teacher=this.teacherService.findOneById(classes.getTeacherDirector().getId(),Teacher.class);
				if(teacher!=null){//
					teacher.setClasseTeach(null);
					this.teacherService.save(teacher);
				}
				//清空班级班主
				classes.setTeacherDirector(null);
				
			}else if(type.equals("assistant")){//副班主任
				classes.setClasseSyllabus(null);
			}
			this.classesService.save(classes);//更新
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	

	/**
	 * 检查名字是否已经存在
	 */
	@RequestMapping(value = "ajaxCheckName", method = RequestMethod.POST) 
    public void ajaxCheckIsName(String  name,Integer yearNumber ,PrintWriter printWriter,HttpSession session) {} 
	
	

	/**
	 * 检查部班级编号是否已经存在
	 */
	@RequestMapping(value = "ajaxCheckNameNum", method = RequestMethod.POST) 
    public void ajaxCheckNameNum(String  num,PrintWriter printWriter,HttpSession session) {} 


}
