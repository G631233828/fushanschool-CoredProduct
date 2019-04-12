package com.cored.website.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.cored.framework.action.GeneralAction;
import com.cored.framework.pojo.ReturnBean;
import com.cored.framework.util.CommonEnum;
import com.cored.framework.util.PathUtil;
import com.cored.framework.util.RandomUtil;
import com.cored.framework.util.UrlEncUtil;
import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;
import com.cored.permission.util.LayerMenu;
import com.cored.school.pojo.MessageRepository_File;
import com.cored.school.pojo.User;
import com.cored.school.pojo.UserRole;
import com.cored.school.service.UserRoleService;
import com.cored.school.util.FileOperateUtil;
import com.cored.school.util.FileType;
import com.cored.school.util.ImageTool;
import com.cored.school.util.RandomUUID;
import com.cored.website.pojo.News;
import com.cored.website.service.NewsService;

@Controller
@RequestMapping("/webSchool")
public class NewsController extends GeneralAction<News> {
	private static final Logger LOG = LoggerFactory
			.getLogger(NewsController.class);
	@Autowired
	private PermissionRoleService permissionRoleService;// 角色信息
	@Autowired
	private PermissionMenuService permissionMenuService;
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private UserRoleService userRoleService;//用户信息

	@RequestMapping("/list")
	public ModelAndView list(HttpSession session,String token) {
		Query query = super.craeteQueryWhere("roleName", token);// 查找管理后台菜单
		List<PermissionRole> listRole=new ArrayList<PermissionRole>();
		
		if(token.equals("WebMain")){
			//查询学校所有老师信息
			User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
			//动态加载主网站的菜单信息
			UserRole userRole=this.userRoleService.findOneById(user.getRole(), UserRole.class);//加载用户角色菜单
		
			if(userRole!=null){
				//找到主网站的菜单
				List<PermissionMenu> pmMain=new ArrayList<PermissionMenu>();
				for(PermissionMenu pm:userRole.getPermissionMenu()){
					if(pm.getMenuName().equals("校园主网站")){
						pmMain.add(pm);//
						break;
					}
				}
				PermissionRole pr=new PermissionRole();
				pr.setListMenu(pmMain);
				//添加
				listRole.add(pr);
				
			}
		}else{
			listRole = permissionRoleService.find(query,
					PermissionRole.class);
		}
		
		session.setAttribute(CommonEnum.WEBSCHOOLMENU, listRole);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:newsstatistics?token="+token);
		return modelAndView;
	}

	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping("/newsstatistics")
	public ModelAndView newsStatistics(String token) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("token", token);
		modelAndView.setViewName("/mainWeb/news-statist");
		return modelAndView;
	}

	/**
	 * 编辑器上传文件
	 * 
	 * @param multipartFiles
	 * @param request
	 * @return
	 */
	@RequestMapping("/editImgUpload")
	@ResponseBody
	public ReturnBean editImgUpload(
			@RequestParam(value = "file", required = true) MultipartFile multipartFiles,
			HttpServletRequest request) {
		ReturnBean returnBean = ReturnBean.returnBeanBuild();
		if (multipartFiles.isEmpty()) {
			LOG.info("上传的图片为空");
			returnBean.setReturnMsg("上传图片为空");
			returnBean.setReturnCode(CommonEnum.ERROR);
			return returnBean;
		}
		String targetFileName = fileUpload(multipartFiles, request);
		// 返回一个网络路径http://localhost:8080/app-web-portal/file/aa.jpg
		//不应该返回一个网络路径，应该是项目路径 ：/file/aa.jpg
		StringBuffer reponsePath = new StringBuffer(PathUtil.SLASH_ONE)
		.append(CommonEnum.WEBSCHOOLFILEPATH)
		.append(PathUtil.SLASH_ONE).append(targetFileName);
//		StringBuffer reponsePath = new StringBuffer("http://")
//				.append(request.getLocalAddr()).append(":")
//				.append(request.getLocalPort())
//				.append(request.getContextPath()).append(PathUtil.SLASH_ONE)
//				.append(CommonEnum.WEBSCHOOLFILEPATH)
//				.append(PathUtil.SLASH_ONE).append(targetFileName);
		
		returnBean.setData(reponsePath).setReturnCode(CommonEnum.OK)
				.setReturnMsg("图片上传成功");
		LOG.info("upload file response file:{}", reponsePath);
		return returnBean;
	}

	private String fileUpload(MultipartFile multipartFiles,
			HttpServletRequest request) {
		String fileName = multipartFiles.getOriginalFilename();
		// 重命名当前的文件名
		String targetName = RandomUtil.getUUID();
		String extensionName = PathUtil.getExtension(fileName);
		String targetFileName = targetName.concat(extensionName);
		// 上传到项目的files目录下面
		StringBuffer absoultePath = new StringBuffer(request.getSession()
				.getServletContext().getRealPath("/")).append(File.separator)
				.append("WEB-INF").append(File.separator)
				.append(CommonEnum.WEBSCHOOLFILEPATH).append(File.separator)
				.append(targetFileName);
		try {
			File targetFile = new File(absoultePath.toString());
			if (!targetFile.exists()) {
				targetFile.createNewFile();
			}
			multipartFiles.transferTo(targetFile);
		} catch (IllegalStateException e) {
			LOG.error(e.getMessage(), e);
		} catch (IOException e) {
			LOG.error(e.getMessage(), e);
		}
		return targetFileName;
	}
	
	
	//加载菜单
	public LayerMenu loadMenu(String roleName){
		LayerMenu layerMenu=new LayerMenu();
		
		Query query = super.craeteQueryWhere("roleName", roleName);
		PermissionRole PermissionRole = permissionRoleService.findOneByQuery(query, PermissionRole.class);
		LOG.info(PermissionRole.toString());
		if(PermissionRole!=null){
			layerMenu.setName(roleName);
			layerMenu.setPermissionMenu(PermissionRole.getListMenu().get(0));//每一个，也只有一个
			return layerMenu;
		}
		return null;
	}
	
	
	
	@RequestMapping("/addnews-view")
	public ModelAndView addNewsView(String menuName, String moduleId,String token,HttpServletRequest request) throws UnsupportedEncodingException {
		if (StringUtils.isEmpty(menuName) || StringUtils.isEmpty(moduleId)) {
			LOG.error("当前参数为空");
			return null;
		}
		ModelAndView modelAndView = new ModelAndView();
		
		String []selectRoleName={"FuShang-School"};
		List<LayerMenu> listLayerMenu=new ArrayList();
		for(String roleName:selectRoleName){
			listLayerMenu.add(loadMenu(roleName));
		}
		modelAndView.addObject("listLayerMenu",listLayerMenu);

		
//		String name = UrlEncUtil.decode(menuName);
	/*	String name = new String(menuName.getBytes("iso8859-1"),"UTF-8");*/
		
		User user=(User)request.getSession().getAttribute(CommonEnum.LOGINUSER);
		modelAndView.addObject("author",user.getUsername());
		modelAndView.addObject("simpleDate",new Date());
		modelAndView.setViewName("/mainWeb/add-news");
		modelAndView.addObject("name", menuName);
		modelAndView.addObject("moduleId", moduleId);
		modelAndView.addObject("token", token);
		return modelAndView;
	}

	
	
	/**
	 * 添加新闻
	 * 
	 * @return
	 */
	@RequestMapping("/updatenews")
	public ModelAndView updatenews(@RequestParam(value = "file") MultipartFile multipartFiles, @DateTimeFormat(pattern="yyyy-MM-dd") Date acceptDate,
			String moduleId, String createDate, String tokens, String moduleIds,String moduleNames, 
			String token, String privates, HttpServletRequest request, String menuName,String id,
			String title,String author,String source,int top,int state,String content) {
		LOG.info("OK");
		if (StringUtils.isEmpty(moduleId)) {
			LOG.error("当前的moduleId为空");
		}
		News news=null;
		if(!StringUtils.isEmpty(id)){
			news=this.newsService.findOneById(id, News.class);//查找新闻id
		}
		if (!StringUtils.isEmpty(multipartFiles)
				&& multipartFiles.getSize() != 0) {
			String targetFileName = fileUpload(multipartFiles, request);
			news.setBananerPic(targetFileName);
			LOG.info("更新新闻时，当前的bananer没有上传图片");
		}
		if (StringUtils.isEmpty(news.getId())) {
			news.setId(null);
		}
		LOG.info("当前模块:{},添加新闻", moduleId);
		User user=(User)request.getSession().getAttribute(CommonEnum.LOGINUSER);
		if(StringUtils.isEmpty(news.getAuthor())){
			news.setAuthor(user.getUsername());
		}
		
		
		news.setTitle(title);
		news.setAuthor(author);
		news.setSource(source);
		news.setTop(top);
		news.setState(state);
		news.setContent(content);
		news.setSchoolId(user.getSchoolId());
		news.setBrowseTimes(0);
		news.setAcceptTime(acceptDate);
		news.setCreateDate(createDate);
		news.setCreateTime(new Date());
		news.setModuleName(menuName);
		news.setPrivates(privates);//如果值等于0，表示些条内容信息，需要登录后。再查看
		news.setToken(token);
		
		newsService.save(news);
		ModelAndView modelAndView = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("findnews");
		Map<String, String> attributes = new HashMap<String, String>();
		attributes.put("menuName", menuName);
		attributes.put("moduleId", moduleId);
		attributes.put("token", news.getToken());
		redirectView.setAttributesMap(attributes);
		modelAndView.setView(redirectView);
		return modelAndView;
	}

	
	/**
	 * 添加新闻
	 * 
	 * @return
	 */
	@RequestMapping("/addnews")
	public ModelAndView addNews(String moduleId, News news,
			@RequestParam(value = "file") MultipartFile multipartFiles,
			String createDate,
			String tokens,
			@DateTimeFormat(pattern="yyyy-MM-dd") Date acceptDate,
			String moduleIds,String moduleNames,
			String token,
			String privates,
			HttpServletRequest request, String menuName) {
		LOG.info("OK");
		if (StringUtils.isEmpty(moduleId)) {
			LOG.error("当前的moduleId为空");
		}
		if (!StringUtils.isEmpty(multipartFiles)
				&& multipartFiles.getSize() != 0) {
			String targetFileName = fileUpload(multipartFiles, request);
			news.setBananerPic(targetFileName);
			LOG.info("更新新闻时，当前的bananer没有上传图片");
		}
		if (StringUtils.isEmpty(news.getId())) {
			news.setId(null);
		}
		LOG.info("当前模块:{},添加新闻", moduleId);
		User user=(User)request.getSession().getAttribute(CommonEnum.LOGINUSER);
		if(StringUtils.isEmpty(news.getAuthor())){
			news.setAuthor(user.getUsername());
		}
		news.setSchoolId(user.getSchoolId());
		news.setBrowseTimes(0);
		news.setAcceptTime(acceptDate);
		news.setCreateDate(createDate);
		news.setCreateTime(new Date());
		news.setModuleName(menuName);
		news.setPrivates(privates);//如果值等于0，表示些条内容信息，需要登录后。再查看
		news.setToken(token);
		
		if(request.getSession().getAttribute("fileList-webNews")!=null){
			news.setFileList((List<MessageRepository_File>) request.getSession().getAttribute("fileList-webNews"));
		}
		// 这里直接循环save一下就可以了
		if(!StringUtils.isEmpty(moduleIds)){
			String[] modelIds=moduleIds.split(",");
			String[] moduleNames1=moduleNames.split(",");
			String[] tokens1=moduleNames.split(",");
			for (int i = 0; i < modelIds.length; i++) {
				if(!moduleId.equals(modelIds[i])){
					News news1=new News();
					news1.setId(null);
					news1.setSchoolId(user.getSchoolId());
					news1.setBrowseTimes(0);
					news1.setTitle(news.getTitle());
					news1.setSource(news.getSource());
					news1.setAuthor(news.getAuthor());
					news1.setTop(news.getTop());
					news1.setPrivates(privates);//如果值等于0，表示些条内容信息，需要登录后。再查看
					news1.setState(news.getState());
					news1.setContent(news.getContent());
					news1.setAcceptTime(news.getAcceptTime());
					news1.setCreateDate(news.getCreateDate());
					news1.setCreateTime(news.getCreateTime());
					news1.setModuleName(moduleNames1[i]);
					news1.setBananerPic(news.getBananerPic());
					news1.setModuleId(modelIds[i]);
					news1.setToken(tokens1[i]);
					if(request.getSession().getAttribute("fileList-webNews")!=null){
						news1.setFileList((List<MessageRepository_File>) request.getSession().getAttribute("fileList-webNews"));
					}
					newsService.save(news1);
				}
			}
	
		}
		newsService.save(news);
		//销毁session
		request.getSession().removeAttribute("fileList-webNews");
		
		ModelAndView modelAndView = new ModelAndView();
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("findnews");
		Map<String, String> attributes = new HashMap<String, String>();
		attributes.put("menuName", menuName);
		attributes.put("moduleId", moduleId);
		attributes.put("token", news.getToken());
		redirectView.setAttributesMap(attributes);
		modelAndView.setView(redirectView);
		return modelAndView;
	}

	@RequestMapping("/editfindnews")
	public ModelAndView editfindNews(String newsId, String menuName,
			String moduleId) throws UnsupportedEncodingException {
		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isEmpty(newsId) || StringUtils.isEmpty(menuName)
				|| StringUtils.isEmpty(moduleId)) {
			LOG.error("当前参数为空");
		}
		LOG.info("编辑新闻时查询 newsId:{}", newsId);
		News news = newsService.findOneById(newsId, News.class);
		
		modelAndView.setViewName("/mainWeb/edit-news");
//		String name = UrlEncUtil.decode(menuName);
		/*String name = new String(menuName.getBytes("iso8859-1"),"UTF-8");*/
		modelAndView.addObject("menuName", menuName);
		modelAndView.addObject("moduleId", moduleId);
		modelAndView.addObject("token", news.getToken());
		modelAndView.addObject("news", news);
		return modelAndView;
	}

	/**
	 * 删除新闻
	 * 
	 * @return
	 */
	@RequestMapping("/deletenews")
	@ResponseBody
	public ReturnBean deletenews(String newsId) {
		ReturnBean returnBean = ReturnBean.returnBeanBuild();
		if (StringUtils.isEmpty(newsId)) {
			returnBean.setReturnCode(CommonEnum.ERROR);
			returnBean.setReturnMsg("系统错误！");
			LOG.error("当前的newsId为空");
			return returnBean;
		}
		LOG.info("当前删除新闻 newsId:{}", newsId);
		newsService.remove(newsService.findOneById(newsId, News.class));
		returnBean.setReturnCode(CommonEnum.OK).setReturnMsg("删除新闻成功");
		return returnBean;
	}

	@RequestMapping("/findnews")
	public ModelAndView findNews(String moduleId, String menuName) throws UnsupportedEncodingException {
		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isEmpty(moduleId)) {
			LOG.error("当前的moduleId为空");
		}
		
		
		/*String filePathEnc = new String(menuName.getBytes("iso8859-1"),"UTF-8");*/
		LOG.info(menuName);
		Query query = new Query();
		query.addCriteria(Criteria.where("moduleId").is(moduleId));
		query.with(new Sort(Sort.Direction.ASC, "top"));//置顶为：2，
		query.with(new Sort(Sort.Direction.DESC, "createTime"));
		List<News> news = newsService.find(query, News.class);
		modelAndView.addObject("newslist", news);
		modelAndView.addObject("name", menuName);
		modelAndView.addObject("menuNames", menuName);
/*		modelAndView.addObject("name", filePathEnc);
		modelAndView.addObject("menuNames", filePathEnc);
*/		modelAndView.setViewName("/mainWeb/main-index");
		return modelAndView;
	}

	
	@RequestMapping("/uploadFile")
	public void uploadFile(
			HttpServletRequest request,
			PrintWriter printWriter,
			HttpSession session,
			@RequestParam(value = "file[]", required = false) MultipartFile[] multipartFiles)
			throws IOException {
		
			StringBuffer outFile=new StringBuffer();
		
			List<MessageRepository_File> myfilesList;
			//检查之前是否上传过数据。
			if(session.getAttribute("fileList")!=null){
				myfilesList=(List<MessageRepository_File>) session.getAttribute("fileList");
			}else{
				myfilesList = new ArrayList<MessageRepository_File>();// 文件集合
			}
		
		
		
		String fileContainsType = "";// 资源包含的类型

		LOG.info("新闻－上传图片");
		LOG.info(multipartFiles.toString());
		for (MultipartFile mpfile : multipartFiles) {
			MessageRepository_File MRFile = new MessageRepository_File();// 文件集合

			CommonsMultipartFile cf = (CommonsMultipartFile) mpfile;
			DiskFileItem fi = (DiskFileItem) cf.getFileItem();
			// 获取文件（真实）后缀名
			String prefix = FileOperateUtil.getFilePrefix(mpfile
					.getOriginalFilename());
			// 获取原文件（真实）的名字
			String originalFileName = mpfile.getOriginalFilename();
			// 创建文件的新名字(当前的时间＋后缀)
			String newFileName = new Date().getTime() + prefix;
			// 保存文件的新地址
			StringBuffer path = new StringBuffer(request.getSession()
					.getServletContext().getRealPath("/")).append(File.separator)
					.append("WEB-INF").append(File.separator).append("uploadmr").append(File.separator);
			
			String NewFilepath = path + newFileName;

			// 保存上传的文件到新地址
			FileOutputStream fos = FileUtils.openOutputStream(new File(
					NewFilepath));
			IOUtils.copy(mpfile.getInputStream(), fos);

			// 如果是图片，压缩它
			LOG.info("后缀名:"+prefix);
			if (FileType.picture.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
				LOG.info("图片压缩");
				ImageTool tool = new ImageTool();
				// 创建缩略图片
				// compressPic(大图片路径,生成小图片路径,大图片文件名,生成小图片文名,生成小图片宽度,生成小图片高度,是否等比缩放(默认为true))
				tool.compressPic(path.toString(), path.toString(), newFileName,
						"min_" + newFileName, 500, 300, true);
				MRFile.setFileType("picture");// 文件夹，图片，文档等
				MRFile.setCompressPicName(path + "min_"
						+ newFileName);// 文件的压缩地址（图片使用）
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"picture");//父类的图片类型集合
			}else if(FileType.video.toLowerCase().toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
				MRFile.setFileType("video");//视频
				
				//获取视频的图片信息
				String autoId=RandomUUID.getAutoId()+".jpg";
				String VideoImagePath=path+autoId;
				MRFile.setVideoImage(autoId);//视频图，保存到数据库
				//视频转码为mp4
				
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"video");//父类的图片类型集合
			}else if(FileType.music.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
				MRFile.setFileType("music");// 音乐
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"music");//父类的图片类型集合
			}else if(FileType.document.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
				MRFile.setFileType("document");// 文档
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"document");//父类的图片类型集合
			}else if(FileType.compression.toLowerCase().indexOf(prefix.toLowerCase()) !=-1) {
				MRFile.setFileType("compression");// 压缩
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"compression");//父类的图片类型集合
			}else{
				MRFile.setFileType("other");// 其他
				fileContainsType=FileOperateUtil.fileTypeScreening(fileContainsType,"other");//父类的图片类型集合
			}	

			MRFile.setId(String.valueOf(new Date().getTime()));
			MRFile.setOriginalName(mpfile.getOriginalFilename());// 原名
			MRFile.setGenerateName(newFileName);// 生成的文件名称
			MRFile.setOriginalPath(NewFilepath);// 保存文件的原地址
			MRFile.setExtension(prefix);// 文件扩展名
			myfilesList.add(MRFile);

			LOG.info("文件信息:" + MRFile.toString());
			outFile.append(mpfile.getOriginalFilename()+",");//返回到前台的数据
		}
		// 将内容保存到session
		session.setAttribute("fileList-webNews", myfilesList);
		session.setAttribute("sessionfileContainsType-webNews", fileContainsType);

		printWriter.write(outFile.toString());
		printWriter.flush();
		printWriter.close();

	}
}
