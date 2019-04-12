package com.cored.school.action;

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
import com.cored.school.pojo.Notification;
import com.cored.school.pojo.Notification.Ntype;
import com.cored.school.pojo.User;
import com.cored.school.service.NotificationService;

//学校通知
@Controller
@RequestMapping("/school/notifiction/")
public class NotificationAction extends GeneralAction<Notification> {
	private static final Logger log = LoggerFactory
			.getLogger(NotificationAction.class);
		@Autowired
		private NotificationService notificationService;
		
		
		@RequestMapping("/list")
		public ModelAndView findlist(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("admin/app-school/notification/list");
			log.info("查找所有通知信息");
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			try {
				//查询学校所有部门
				Query query=this.craeteQueryWhere("schoolId",user.getSchoolId());
				modelAndView.addObject("pageList", notificationService.find(query, Notification.class));
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
			modelAndView.setViewName("redirect:/school/notifiction/list");
			log.info("删除的ID:"+id);
			try {
				if (id!=null) {// 删除
					log.info("ID删除");
					Notification n = notificationService.findOneById(id, Notification.class);
					notificationService.remove(n);

				} else if (ids!=null) {
					// 批量删除
					log.info("批量删除");
					String[] idsStr = ids.split(",");
					for (String galleryIds : idsStr) {
						Notification n = notificationService.findOneById(galleryIds,Notification.class);
						notificationService.remove(n);
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
		public ModelAndView createOrUpdateToFind(String id, String title,String author,
				String content, String sendDate, String type,HttpSession session) {
			
			ModelAndView modelAndView = new ModelAndView();
			log.info("添加与更新－部门信息");
			modelAndView.setViewName("redirect:/school/notifiction/list");
			User user =(User) session.getAttribute(CommonEnum.LOGINUSER);
			try {
				//private String title;// 标题
				//private String content;// 内容
				//private Date sendDate;// 发送日期
				//private Ntype type;// 1:家校通知，2校园通知,3：全部.
				Notification n = null;
				if (id == null) {// 添加信息
					n = new Notification();
					n.setTitle(title);
					n.setContent(content);
					n.setSendDate(sendDate);
					n.setType(Ntype.valueOf(type));//通知类型
					n.setSchoolId(user.getSchoolId());//学校ID
					n.setAuthor(author);
					
					notificationService.insert(n);

				} else {// 更新信息
					n = notificationService.findOneById(id,Notification.class);// 查找到当前记录.
					if (n == null)
						n = new Notification();// 如果为空，初始化对象

						n.setTitle(title);
						n.setContent(content);
						n.setSendDate(sendDate);
						n.setType(Ntype.valueOf(type));//通知类型
						n.setSchoolId(user.getSchoolId());//学校ID
						n.setAuthor(author);
					
						notificationService.save(n);// 更新数据信息
				}

			} catch (Exception e) {
				log.info(e.getMessage(),e);
			}// 添加记录
			return modelAndView;
		}
		

}
