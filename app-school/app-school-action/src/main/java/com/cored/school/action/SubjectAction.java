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
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.school.pojo.Department;
import com.cored.school.pojo.Subject;
import com.cored.school.pojo.User;
import com.cored.school.service.SubjectService;
//科目
@Controller
@RequestMapping("/subject")
public class SubjectAction extends GeneralAction<Subject> {
	private static final Logger log = LoggerFactory
			.getLogger(SubjectAction.class);
		@Autowired
		private SubjectService subjectService;//学校科目
		
		
		@RequestMapping("/list")
		public ModelAndView findlist(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/app-school/subject/list");
			log.info("查找科目所有信息");
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			try {
				//查询学校所有科目
				Query query=this.craeteQueryWhere("schoolId",user.getSchoolId());
				modelAndView.addObject("pageList", this.subjectService.find(query, Subject.class));
			} catch (Exception e) {
				log.info(e.getMessage(),e);
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
			modelAndView.setViewName("redirect:/subject/list");
			log.info("删除的ID:"+id);
			try {
				if (id!=null) {// 删除
					log.info("ID删除");
					Subject d = subjectService.findOneById(id, Subject.class);
					subjectService.remove(d);

				} else if (ids!=null) {
					// 批量删除
					log.info("批量删除");
					String[] idsStr = ids.split(",");
					for (String galleryIds : idsStr) {
						Subject d = subjectService.findOneById(galleryIds,Subject.class);
						subjectService.remove(d);
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
				String subjectNum,String remark,HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			log.info("添加与更新－科目信息");
			modelAndView.setViewName("redirect:/subject/list");
			User user =(User) session.getAttribute(CommonEnum.LOGINUSER);
			try {
				//
				Subject d = null;
				if (id == null || id.equals("")) {// 添加信息
					d = new Subject();
					d.setName(name);
					d.setSubjectNum(subjectNum);
					d.setRemark(remark);
					d.setSchoolId(user.getSchoolId());
					subjectService.insert(d);

				} else {// 更新信息
					d = subjectService.findOneById(id,Subject.class);// 查找到当前记录.
					if (d == null)
						d = new Subject();// 如果为空，初始化对象
					d.setName(name);
					d.setSubjectNum(subjectNum);
					d.setRemark(remark);
					d.setSchoolId(user.getSchoolId());
					subjectService.save(d);// 更新数据信息
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
