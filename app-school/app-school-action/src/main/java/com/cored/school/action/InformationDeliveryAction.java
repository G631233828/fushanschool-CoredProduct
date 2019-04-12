//package com.cored.school.action;
//
//import java.text.SimpleDateFormat;
//
//import javax.servlet.http.HttpSession;
//
//import org.app.framework.action.GeneralAction;
//import org.app.framework.util.Pagination;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.cored.school.pojo.InformationDelivery;
//import com.cored.school.pojo.School;
//import com.cored.school.pojo.User;
//import com.cored.school.service.InformationDeliveryService;
//@Controller
//@RequestMapping("/informationDelivery")
//public class InformationDeliveryAction extends GeneralAction<InformationDelivery> {
//	@Autowired
//	private InformationDeliveryService informationDeliveryService;
//	private static final Logger log=LoggerFactory.getLogger(InformationDelivery.class);
//	
//	
//	/***
//	 * 查询所有的发布信息
//	 * @param pid
//	 * @param pageNo
//	 * @param pageSize
//	 * @return
//	 */
//	@SuppressWarnings("unused")
//	@RequestMapping("/list")
//	 public ModelAndView findlist(@RequestParam(value="pid",defaultValue="0") String pid,
//			@RequestParam(value="pageNo",defaultValue="1")Integer pageNo,
//			@RequestParam(value="pageSize",defaultValue="10")Integer pageSize,
//			HttpSession session){
//		 ModelAndView modelAndView=new ModelAndView();
//		 modelAndView.setViewName("app-school/informationDelivery/list");
//		School ss=(School) session.getAttribute("SSchool");//获取学校的session
//		
//		 Pagination<InformationDelivery> pagination;
//		try {
//			if(ss!=null){//如果schoolid不为空根据学校的id去查询
//				pagination = this.informationDeliveryService.findPaginationByQuery(super.getQueryForSchool("schoolId", ss.getId()), pageNo, pageSize);
//			}else{//查询schoolid为空的数据
//				pagination = this.informationDeliveryService.findPaginationByQuery(super.getQueryForSchool("schoolId","0"), pageNo, pageSize);
//			}
//			if(pagination==null)
//				pagination=new Pagination<InformationDelivery>();
//		
//			modelAndView.addObject("pageList",pagination);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			log.info("error"+e);
//		}
//		 
//		 return modelAndView;
//	 }
//	/**
//	 * 删除，批量删除
//	 * @param id
//	 * @param ids
//	 * @return
//	 */
//
//	@RequestMapping("/delete")
//	 public ModelAndView delete(
//			 @RequestParam(value="id",defaultValue="0")String id,
//			 @RequestParam(value="ids",defaultValue="0")String ids){
//		 ModelAndView modelAndView =new ModelAndView();
//		 modelAndView.setViewName("redirect:/informationDelivery/list");
//		 InformationDelivery c;
//		 try {
//			 if(!id.isEmpty()&&!id.equals("0")){
//				 //删除单个
//				c = this.informationDeliveryService.findByid(id);
//				this.informationDeliveryService.remove(c);
//			 }else if(!ids.isEmpty()&&!ids.equals("0")){
//			    //批量删除
//			 String[] idsStr=ids.split(",");
//			 for(String gallerIds:idsStr){
//				 c=this.informationDeliveryService.findByid(gallerIds);
//				 this.informationDeliveryService.remove(c);
//			 }
//		 }
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				log.info("删除信息发布内容出错");
//		 }
//		 
//		 
//		 return modelAndView;
//	 }
//	 
//	 
//	 /***
//	  * 跳转到编辑页面如果id为空执行新增
//	  * @param id
//	  * @return
//	  */
//	@RequestMapping("/updateOrCreate")
//	 public ModelAndView updateOrCreate(
//			 @RequestParam(value="id",defaultValue="0")String id,HttpSession session
//			 ){
//		 ModelAndView modelAndView=new ModelAndView();
//		 modelAndView.setViewName("app-school/informationDelivery/editor");
//		InformationDelivery informationDelivery=null;
//		 User user=(User) session.getAttribute("SUser");//获取User的session
//			if(user!=null){
//				modelAndView.addObject("UserType",user.getType());//获取用户类型	
//				modelAndView.addObject("UserName",user.getUsername());//获取用户名称
//			}
//		 try{
//			 if(!id.equals("0")){
//				 informationDelivery=this.informationDeliveryService.findByid(id);
//				
//				 if(infoForm==null)
//					 infoForm=new InformationDelivery();
//			 }else{
//				 
//			 }
//			 
//			 
//		 }catch(Exception e){
//			 e.printStackTrace();
//			 log.info("信息发布编辑页面跳转出错");
//		 }
//		 modelAndView.addObject("informationDelivery", informationDelivery);
//		 
//		 
//		 return modelAndView;
//	 }
//	 
//	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST) 
//	 public ModelAndView createOrUpdateToFind(@RequestParam(value="id",defaultValue="0") String id,String title,String content,String receive,String contentType,String author,String setDate,@RequestParam(value="schoolId",defaultValue="0")String schoolId){
//		 ModelAndView modelAndView=new ModelAndView();
//		 modelAndView.setViewName("redirect:/informationDelivery/list");
//		 try{
//			 SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
//			InformationDelivery c=null;
//			if(id.isEmpty()&&id.equals("0")){
//				c=new InformationDelivery();
//				c.setTitle(title);
//				c.setContent(content);
//				c.setReceive(receive);
//				c.setContentType(contentType);
//				c.setAuthor(author);
//				c.setSetDate(format.parse(setDate));
//				c.setSchoolId(schoolId);
//				this.informationDeliveryService.insert(c);
//			}else{
//				c=this.informationDeliveryService.findByid(id);
//				if(c==null)
//					c=new InformationDelivery();
//				c.setTitle(title);
//				c.setContent(content);
//				c.setReceive(receive);
//				c.setContentType(contentType);
//				c.setAuthor(author);
//				c.setSetDate(format.parse(setDate));
//				c.setSchoolId(schoolId);
//				this.informationDeliveryService.save(c);
//			}
//			 
//		 }catch(Exception e){
//			 e.printStackTrace();
//			 log.info("添加发布信息出错");
//		 }
//		 
//		 
//		 return modelAndView;
//	 }
//	 
//	 
//	 
//	 
//	 
//
//}
//
//
//
//
//
//
//
//
//
//
