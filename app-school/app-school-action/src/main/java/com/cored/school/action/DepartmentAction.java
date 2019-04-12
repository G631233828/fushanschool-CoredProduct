package com.cored.school.action;

import java.io.PrintWriter;

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
import com.cored.school.pojo.Department;
import com.cored.school.pojo.Teacher;
import com.cored.school.pojo.User;
import com.cored.school.service.DepartmentService;
import com.cored.school.service.TeacherService;

@Controller
@RequestMapping("/department")
public class DepartmentAction extends GeneralAction<Department> {
	private static final Logger log = LoggerFactory
			.getLogger(DepartmentAction.class);
		@Autowired
		private DepartmentService departmentService;//部门
		@Autowired
		private TeacherService teacherService;//学校老师
		
		
		@RequestMapping("/list")
		public ModelAndView findlist(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/app-school/department/list");
			log.info("查找部门所有信息");
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			try {
				//查询学校所有部门
				Query query=this.craeteQueryWhere("schoolId",user.getSchoolId());
				modelAndView.addObject("pageList", departmentService.find(query, Department.class));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return modelAndView;
		}
		/**
		 * 删除与批量删除
		 * 
		 * @param id
		 * @param ids
		 * @return
		 */
		@RequestMapping("/delete")
		public ModelAndView delete(String id,String ids) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/department/list");
			log.info("删除的ID:"+id);
			try {
				if (id!=null) {// 删除
					log.info("ID删除");
					Department d = departmentService.findOneById(id, Department.class);
					departmentService.remove(d);

				} else if (ids!=null) {
					// 批量删除
					log.info("批量删除");
					String[] idsStr = ids.split(",");
					for (String galleryIds : idsStr) {
						Department d = departmentService.findOneById(galleryIds,Department.class);
						departmentService.remove(d);
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
		public ModelAndView createOrUpdateToFind(String id, String name,
				String departmentNum, String manageDepartment, String describe,
				String remark,HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			log.info("添加与更新－部门信息");
			modelAndView.setViewName("redirect:/department/list");
			User user =(User) session.getAttribute(CommonEnum.LOGINUSER);
			try {
				//
				Department d = null;
				if (id == null) {// 添加信息
					d = new Department();
					d.setName(name);
					d.setDepartmentNum(departmentNum);
					//加载部门管理者的个人资料
					d.setManageDepartment(null);
					d.setSchoolId(user.getSchoolId());
					d.setDescribe(describe);
					d.setRemark(remark);
					departmentService.insert(d);

				} else {// 更新信息
					d = departmentService.findOneById(id,Department.class);// 查找到当前记录.
					if (d == null)
						d = new Department();// 如果为空，初始化对象
					d.setName(name);
					d.setDepartmentNum(departmentNum);
					//加载部门管理者的个人资料
					d.setManageDepartment(null);
					d.setSchoolId(user.getSchoolId());
					d.setDescribe(describe);
					d.setRemark(remark);
					departmentService.save(d);// 更新数据信息
				}

			} catch (Exception e) {
				log.info(e.getMessage(),e);
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
		 * 检查部门编号是否已经存在
		 */
		@RequestMapping(value = "ajaxCheckNameNum", method = RequestMethod.POST) 
	    public void ajaxCheckNameNum(String  name,PrintWriter printWriter,HttpSession session) {} 
	
}
