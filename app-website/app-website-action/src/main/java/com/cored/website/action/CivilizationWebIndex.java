package com.cored.website.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.util.CommonEnum;
import com.cored.framework.util.Pagination;
import com.cored.framework.util.UrlEncUtil;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.pojo.PermissionSubMenu;
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;
import com.cored.school.pojo.Notification;
import com.cored.school.pojo.User;
import com.cored.school.service.NotificationService;
import com.cored.website.bean.WebMainBean;
import com.cored.website.pojo.News;
import com.cored.website.service.NewsService;
import com.cored.website.util.UtilAction;

//2016迪士尼文化周
@Controller
@RequestMapping("/web/civilization")
public class CivilizationWebIndex  extends GeneralAction<News> {
	private static final Logger log = LoggerFactory.getLogger(CivilizationWebIndex.class);
	@Autowired
	private PermissionRoleService permissionRoleService;// 角色信息
	@Autowired
	private PermissionMenuService permissionMenuService;// 菜单信息
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private NotificationService notificationService;

	
	@RequestMapping("/index")
	public ModelAndView list(HttpSession session) {
		//检查菜单不等于空（菜单权限）
		if(session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION)==null)
			getWebMainMenuToSession(session);
		log.info("select web mainIndex page");
		ModelAndView modelAndView = new ModelAndView();
		
		//加载 "外语节报道"
		modelAndView.addObject("pageList", notificationService.find(new Query(), Notification.class));
		
		Query query = new Query();
		query.addCriteria(Criteria.where("moduleName").is("外语节活动报道"));
		
		query.with(new Sort(Sort.Direction.DESC, "createTime"));
		
		modelAndView.addObject("pageList", this.newsService.findPaginationByQuery(query, 0, 5, News.class));
		
		modelAndView.setViewName("/civilizationWeb/2019/index");
		return modelAndView;
		
	}
	
	//2016迪士尼文化周  图片新闻， 文字新闻
	public List<News> loadImgNews(boolean img,String createid){
		Query qimg = new Query();
		qimg.addCriteria(Criteria.where("token").is("FuShang-School"));
		qimg.addCriteria(Criteria.where("bananerPic").exists(img));
		qimg.addCriteria(Criteria.where("moduleId").is(createid));
		qimg.with(new Sort(Sort.Direction.DESC, "createTime"));
		Pagination<News>  pageList=this.newsService.findPaginationByQuery(qimg, 1, 20, News.class);
		if (pageList == null)
			return null;
		else
			return pageList.getDatas();
		
	}
	
	// 图片新闻
		public List<News> loadImgNews(boolean img){
			Query qimg = new Query();
			qimg.addCriteria(Criteria.where("token").is("FuShang-School"));
			qimg.addCriteria(Criteria.where("bananerPic").exists(img));
			qimg.with(new Sort(Sort.Direction.DESC, "createTime"));
			Pagination<News>  pageList=this.newsService.findPaginationByQuery(qimg, 1, 20, News.class);
			if (pageList == null)
				return null;
			else
				return pageList.getDatas();
			
		}
	
	
	
	//查找当前记录下的所有新闻
		@RequestMapping("/list")
		public ModelAndView findNews(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
				@RequestParam(value = "pageSize", defaultValue = "15") Integer pageSize,String menuName,
				HttpSession session,String superid,String id,String moduleId,String isone,String isMenu) throws UnsupportedEncodingException {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("isMenu", isMenu);
			modelAndView.addObject("isone", isone);
			
			modelAndView.addObject("up-menuName", menuName);
			log.info("前："+menuName);
			
			/*menuName = new String(menuName.getBytes("iso8859-1"),"UTF-8");*/
			modelAndView.addObject("menuName", menuName);
			log.info(menuName);
			//检查菜单不等于空
			if(session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION)==null)
				getWebMainMenuToSession(session);
			
			//获取到父ID,以后子ID查询
			PermissionSubMenu pm=null;
			if(isMenu!=null && isMenu.equals("two")){
				pm=getTwoMenu(superid,id,session);//右过的菜单栏
			}else if (isMenu!=null && isMenu.equals("three")){
				//getTwoMenu
				pm=getTwoMenu(superid,id,session);//右边的三级菜单
			}else {
				pm=getMenu(superid,id);//右过的菜单栏
			}
			if (StringUtils.isEmpty(moduleId)) {
				log.error("当前的moduleId为空");
			}
			//查找新闻集合
			
			Query query = new Query();
			//TODO
			//query.addCriteria(Criteria.where("token").is("CivilizationWeb"));
			if(isone!=null && isone.equals("yes")){
				modelAndView.addObject("isone", isone);
				log.info("一级菜单：");
				//用户点击的是一级菜单   in
				if(isMenu!=null && isMenu.equals("two")){//一级菜单
					query.addCriteria(Criteria.where("moduleId").in(UtilAction.getTwoSubListId((List<PermissionRole>) session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION), moduleId,superid)));
				}else if (isMenu!=null && isMenu.equals("one")){//二级菜单
					query.addCriteria(Criteria.where("moduleId").in(UtilAction.getSubListId((List<PermissionRole>) session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION), moduleId)));
				}else{//三级菜单
					query.addCriteria(Criteria.where("moduleId").in(moduleId));
				}
			}else{
			//查找新闻集合 (二级子菜单)
				log.info("二级菜单：");
				query.addCriteria(Criteria.where("moduleId").is(moduleId));
				
			}
			query.with(new Sort(Sort.Direction.ASC, "top"));//置顶为：2，
			query.with(new Sort(Sort.Direction.DESC, "createTime"));
			Pagination<News>  pageList=this.newsService.findPaginationByQuery(query, pageNo, pageSize, News.class);
			if (pageList == null)
				pageList = new Pagination<News>();
			
			
			
			modelAndView.addObject("newslist", pageList);
			modelAndView.addObject("pm", pm);//该菜单的同一级目录
			modelAndView.addObject("superid", superid);//菜单父类ID
			
			modelAndView.addObject("id", id);
			modelAndView.addObject("moduleId", moduleId);
			
			
			
			
			
			
			//图片新闻
			modelAndView.addObject("listImg",selectImgOrText(true));
			//文字新闻
			modelAndView.addObject("listText",selectImgOrText(false));
			
			modelAndView.setViewName("/civilizationWeb/2019/list");
			return modelAndView;
		}
		
		/**
		 * pic is True 图片
		 * pic is flase 文档
		 * @param pic 只加载五条记录
		 * @return
		 */
		public  List<News> selectImgOrText(boolean pic){
			Query query = new Query();
			query.addCriteria(Criteria.where("bananerPic").exists(pic));
			query.addCriteria(Criteria.where("token").is("FuShang-School"));
			query.with(new Sort(Sort.Direction.DESC, "createTime"));
			
			Pagination<News>  pageList=this.newsService.findPaginationByQuery(query, 1, 5, News.class);
			if (pageList == null)
				return null;
			else
				return pageList.getDatas();
			
			
		}
	
	
	//查信息明细
	@RequestMapping("/find")
	public ModelAndView editfindNews(HttpSession session,String superid,String id,String newsId, String menuName,
			String moduleId) {
		//检查菜单不等于空
		if(session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION)==null)
			getWebMainMenuToSession(session);
		
		//获取到父ID,以后子ID查询
		PermissionSubMenu pm=getMenu(superid,id);//右过的菜单栏
		
		
		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isEmpty(newsId) || StringUtils.isEmpty(menuName)
				|| StringUtils.isEmpty(moduleId)) {
			log.error("当前参数为空");
		}
		log.info("编辑新闻时查询 newsId:{}", newsId);
		News news = newsService.findOneById(newsId, News.class);
		
		//检查当前的新闻是不是需要登录后才能看
				if(news.getPrivates()!=null){
					if(news.getPrivates().equals("0") ){
						//验证用户是否已经登录过
						if(session.getAttribute(CommonEnum.LOGINUSER)==null){
							modelAndView.setViewName("/admin/login");//返回登录界面，先登录
						}else{
							modelAndView.setViewName("/civilizationWeb/2019/find");
						}
					}else{//无需登录，直接可以访问
						modelAndView.setViewName("/civilizationWeb/2019/find");
					}
				}else{
					modelAndView.setViewName("/civilizationWeb/2019/find");
				}
		
		
		String name = UrlEncUtil.decode(menuName);
//		modelAndView.setViewName("/civilizationWeb/find");
		modelAndView.addObject("menuName", name);
		modelAndView.addObject("moduleId", moduleId);
		modelAndView.addObject("superid", superid);//菜单父类ID
		modelAndView.addObject("news", news);
		modelAndView.addObject("pm", pm);//该菜单的同一级目录
		
		
		//访问量加＋1
				if(news.getBrowseTimes()==null)
					news.setBrowseTimes(new Integer(0));
				news.setBrowseTimes(news.getBrowseTimes()+1);
				this.newsService.save(news);//保存访问量加＋1
		
		//图片新
		Query qimg = new Query();
		qimg.addCriteria(Criteria.where("bananerPic").exists(true));
		qimg.with(new Sort(Sort.Direction.DESC, "createTime"));
		List<News> listImg=new ArrayList<News>();
		
		listImg=this.newsService.find(qimg, News.class);
		
		modelAndView.addObject("listImg",listImg);
		return modelAndView;
	}
	
	

	//查找当前记录下的所有新闻
	@RequestMapping("/select")
	public ModelAndView select(
			@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
			@RequestParam(value = "pageSize", defaultValue = "15") Integer pageSize,
			HttpSession session,String name) {
		//获取数据
		ModelAndView modelAndView = new ModelAndView();
		//检查菜单不等于空
		if(session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION)==null)
			getWebMainMenuToSession(session);
		//查找数据
		Pagination<News>  pageList = new Pagination<News>();
		Query query = new Query();
		query.addCriteria(Criteria.where("token").is("FuShang-School"));//少年宫网站

		if(name!=null && !name.equals("")){//检选择的菜单
			query.addCriteria(Criteria.where("title").regex(name));//标题
		}
		query.with(new Sort(Sort.Direction.ASC, "top"));//置顶为：2，
		query.with(new Sort(Sort.Direction.DESC, "createTime"));
		pageList=this.newsService.findPaginationByQuery(query, pageNo, pageSize, News.class);

		modelAndView.addObject("newslist", pageList);
		
		modelAndView.addObject("name",name);
		
		//文字新闻
		modelAndView.addObject("listText",selectImgOrText(false));

		modelAndView.setViewName("/civilizationWeb/2019/select");
		return modelAndView;
	}
	
	
	///////////////////////读取主网站的“校园新闻”功能/////////////////////
	//主网站的菜单 与  session
		public void getWebMainMenu(HttpSession session){
			Query query = super.craeteQueryWhere("roleName", "WebMain");// 查找管理后台菜单
			List<PermissionRole> listRole = permissionRoleService.find(query,
					PermissionRole.class);
			session.setAttribute(CommonEnum.WEBMAINSESSION, listRole);
		}
	//创建动态  图片新闻， 文字新闻
	public List<News> loadMainSchoolNews(HttpSession session){
		//主网站的session
		if(session.getAttribute(CommonEnum.WEBMAINSESSION)==null)
			getWebMainMenuToSession(session);
		
		for(WebMainBean wmb :getMainId(session)){
			log.info("首页 “校园新闻” id:"+wmb.getName());
			Query query = new Query();
			//TODO
			query.addCriteria(Criteria.where("moduleId").is(wmb.getId()));
			query.with(new Sort(Sort.Direction.DESC, "createTime"));
			Pagination<News>  pageList=this.newsService.findPaginationByQuery(query, 1, 10, News.class);
			if(pageList!=null)
				return pageList.getDatas();
			else 
				return null;
		}
		return null;
	}
	
	//获取 主网站的 “校园新闻”    
	public List<WebMainBean> getMainId(HttpSession session){
		//获取菜单数据
		List<PermissionRole> listRole=(List<PermissionRole>) session.getAttribute(CommonEnum.WEBMAINSESSION);
		List<WebMainBean> listMenuId=new ArrayList<WebMainBean>();
		log.info("select list Menu:"+listRole.toString());
		for (PermissionRole pr : listRole) {
			for (PermissionMenu pm : pr.getListMenu()) {
				for (PermissionSubMenu psmsuper : pm.getListPermissionSubMenu()) {
					if (psmsuper.getListPermissionSubMenu() != null) {
						for (PermissionSubMenu psm : psmsuper
								.getListPermissionSubMenu()) {
							// //每周工作，校园新闻，教师发展，各类通知，（校园活动）
							if (psm.getMenuName().equals("校园新闻")) {
								WebMainBean wmb = new WebMainBean();
								wmb.setId(psm.getId());
								wmb.setName(psm.getMenuName());
								wmb.setSameDirectory(psmsuper.getId());//同级目录
								wmb.setSuperDirectory(pm.getId());//父级目录
								listMenuId.add(wmb);// 获取这几个菜单的ID
							}
						}
					}
				}
			}
		}
		return listMenuId;
	}
	
////////////////////主网站 的查询  ////////////////////////	
	
	
	
	//获取页面需要查询的集合数据
	public List<WebMainBean> getIndexListId(HttpSession session){
		//获取菜单数据
		List<PermissionRole> listRole=(List<PermissionRole>) session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION);
		List<WebMainBean> listMenuId=new ArrayList<WebMainBean>();
		log.info("select list Menu:"+listRole.toString());
		for (PermissionRole pr : listRole) {
			for (PermissionMenu pm : pr.getListMenu()) {
				for (PermissionSubMenu psmsuper : pm.getListPermissionSubMenu()) {
					//一级菜单 //创建动态   基本指标   特色指标
					if (psmsuper.getMenuName().equals("创建动态")||
							psmsuper.getMenuName().equals("基本指标")||
							psmsuper.getMenuName().equals("特色指标")||
							psmsuper.getMenuName().equals("学校章程")||
							psmsuper.getMenuName().equals("社会责任")) {
						
						WebMainBean wmb = new WebMainBean();
						wmb.setId(psmsuper.getId());
						wmb.setName(psmsuper.getMenuName());
						wmb.setSameDirectory(psmsuper.getId());//同级目录
						wmb.setSuperDirectory(pm.getId());//父级目录
						listMenuId.add(wmb);// 获取这几个菜单的ID
					}
					
				}
			}
		}
		return listMenuId;
	}
	
	
	//检查前台菜单是否存在
	public void getWebMainMenuToSession(HttpSession session){
		Query query = super.craeteQueryWhere("roleName", "FuShang-School");// 查找管理后台菜单
		List<PermissionRole> listRole = permissionRoleService.find(query,
				PermissionRole.class);
		session.setAttribute(CommonEnum.WEBCIVILIZATIONSESSION, listRole);
	}
	
	//一级菜单
	public PermissionSubMenu getMenu(String superid,String id){
		PermissionMenu listP=this.permissionMenuService.findOneById(superid, PermissionMenu.class);
		if(listP!=null){
				for(PermissionSubMenu pm:listP.getListPermissionSubMenu()){
					if(pm.getId().equals(id)){
						return pm;
					}
				}
		}
		return null;
		
	}
	
	//二级菜单
		public PermissionSubMenu getTwoMenu(String superid,String id,HttpSession session){
			List<PermissionRole>  listP=(List<PermissionRole>) session.getAttribute(CommonEnum.WEBCIVILIZATIONSESSION);
			for (PermissionRole pr : listP) {
				for (PermissionMenu pm : pr.getListMenu()) {
					for (PermissionSubMenu psmsuper : pm.getListPermissionSubMenu()) {
						
							if(psmsuper.getId().equals(id)) return psmsuper;
							
							if (psmsuper.getListPermissionSubMenu()!=null) {//一级菜单
							for (PermissionSubMenu psm : psmsuper.getListPermissionSubMenu()) {
								if(psm.getId().equals(id)){
									return psm;
								}
								
							}
							
						}
						
					}
				}
			}
			return null;
			
		}
	
}
