package com.cored.school.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.school.pojo.Application;
import com.cored.school.pojo.Department;
import com.cored.school.pojo.User;
import com.cored.school.service.ApplicationService;
import com.cored.school.service.DepartmentService;

/**
 * 学校各类申请（请假，报修，专用定，用车）
 * @author mac
 *
 */
@Controller
@RequestMapping("/school/application")
public class ApplicationAction extends GeneralAction<Application> {
	private static final Logger log = LoggerFactory
			.getLogger(ApplicationAction.class);
		@Autowired
		private ApplicationService applicationService;
		@Autowired
		private DepartmentService departmentService;//部门
		
		
		@RequestMapping("/list")
		public ModelAndView findlist(HttpSession session,String idCode) {
			if(idCode.equals(null))return null;
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			
			ModelAndView modelAndView = new ModelAndView();
			//// 标识id,1:请假，2：报修，3：用车，4：专用室
			//不同的跳转到不财的页面
			SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
			modelAndView.addObject("newDate", sdf.format(new Date()));
			if(idCode.equals("1")){
				modelAndView.setViewName("admin/app-school/leave/list");
			}else if(idCode.equals("2")){
				modelAndView.setViewName("admin/app-school/repairs/list");
			}else if(idCode.equals("3")){
				modelAndView.setViewName("admin/app-school/car/list");
				//加载部门
				Query query=this.craeteQueryWhere("schoolId",user.getSchoolId());
				modelAndView.addObject("depList", departmentService.find(query, Department.class));
			}else if(idCode.equals("4")){
				modelAndView.setViewName("admin/app-school/homework/list");
				//加载部门
				Query query=this.craeteQueryWhere("schoolId",user.getSchoolId());
				modelAndView.addObject("depList", departmentService.find(query, Department.class));
				
			}
			
			
			log.info("查找所有信息的类型是:"+idCode);
		
			try {
				//查询学校所有部门
				Query query=new Query();
				query.addCriteria(Criteria.where("schoolId").is(user.getSchoolId()));
				query.addCriteria(Criteria.where("idCode").is(idCode));
				modelAndView.addObject("pageList", applicationService.find(query, Application.class));
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
		public ModelAndView delete(String id,String ids,String idCode) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/school/application/list?idCode="+idCode);
			log.info("删除的ID:"+id);
			try {
				if (id!=null) {// 删除
					log.info("ID删除");
					Application n = applicationService.findOneById(id, Application.class);
					applicationService.remove(n);

				} else if (ids!=null) {
					// 批量删除
					log.info("批量删除");
					String[] idsStr = ids.split(",");
					for (String galleryIds : idsStr) {
						Application n = applicationService.findOneById(galleryIds,Application.class);
						applicationService.remove(n);
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
		 private String name;// 申请人
	private String nameid;// 申请人的ID

	private String type;// 请假类型，设备的类型，会议室类型（会议室1，会议室2）
	private String dempartment;// （会议室使用的部门，用车申请）

	private String sdate;// 开始时间（请假使用,专用室，用车申请）
	private String edate;// 结束时间（请假使用,专用室，用车申请）

	private String message;// 申请理由，报修的内容，申请专用室的理由，用车申请理由
	private String repairsAddredd;// 报修的地址，申请专用室需要准备的工作

	private String status;// 申请的状态
	private String isHK;// 是否需要安排换课

	private String idCode;// 标识id,1:请假，2：报修，3：专用室，4：用车
		 * @return
		 */
		@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
		public ModelAndView createOrUpdateToFind(String id,String type, String dempartment,String sdate,
				String edate, String message, String repairsAddredd,
				String status, String isHK, String idCode,HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			log.info("添加与更新－部门信息");
			modelAndView.setViewName("redirect:/school/application/list?idCode="+idCode);
			User user =(User) session.getAttribute(CommonEnum.LOGINUSER);
			try {

				Application n = null;
				if (id == null || id=="") {// 添加信息
					n = new Application();
					// 标识id,1:请假，2：报修，3：专用室，4：用车
						n.setNameid(user.getId());
						n.setName(user.getName());
						n.setSchoolId(user.getSchoolId());
						n.setType(type);
						n.setDempartment(dempartment);
						n.setIdCode(idCode);// 标识id,1:请假，2：报修，3：专用室，4：用车
						n.setSdate(sdate);
						n.setEdate(edate);
						n.setMessage(message);
						n.setRepairsAddredd(repairsAddredd);
						n.setStatus("1");//待审核中
						n.setIsHK("否");
						

					log.info(n.toString());
					applicationService.insert(n);

				} else {// 更新信息
					n = applicationService.findOneById(id,Application.class);// 查找到当前记录.
					if (n == null)
						n = new Application();// 如果为空，初始化对象
					// 标识id,1:请假，2：报修，3：专用室，4：用车
					n.setNameid(user.getId());
					n.setName(user.getName());
					n.setSchoolId(user.getSchoolId());
					n.setType(type);
					n.setDempartment(dempartment);
					n.setIdCode(idCode);// 标识id,1:请假，2：报修，3：专用室，4：用车
					n.setSdate(sdate);
					n.setEdate(edate);
					n.setMessage(message);
					n.setRepairsAddredd(repairsAddredd);
					n.setStatus("1");//待审核中
					n.setIsHK("否");
					
					applicationService.save(n);// 更新数据信息
				}

			} catch (Exception e) {
				log.info(e.getMessage(),e);
			}// 添加记录
			return modelAndView;
		}
		
		
		
		@RequestMapping(value = "/auditInformation")
		public ModelAndView auditInformation(String id,String idCode,String status,HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			log.info("添加与更新－部门信息");
			modelAndView.setViewName("redirect:/school/application/list?idCode="+idCode);
			Application a = applicationService.findOneById(id,Application.class);// 查找到当前记录.
			if(a!=null){
				a.setStatus(status);
			}
			this.applicationService.save(a);//更新
			
			return modelAndView;
		}

}
