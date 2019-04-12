package com.cored.school.action;

import java.io.File;
import java.io.PrintWriter;
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
import com.cored.school.pojo.Classes;
import com.cored.school.pojo.School;
import com.cored.school.pojo.Student;
import com.cored.school.pojo.User;
import com.cored.school.service.ClassesService;
import com.cored.school.service.StudentService;
import com.cored.school.util.FileOperateUtil;

@Controller
@RequestMapping("/student")
public class StudentAction extends GeneralAction<Student> {
	private static final Logger log = LoggerFactory
			.getLogger(StudentAction.class);

	@Autowired
	private StudentService studentService;
	@Autowired
	private ClassesService classesService;
	
	
	@RequestMapping("/list")
	public ModelAndView findlist(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/app-school/student/list");
		log.info("查找所有学生信息");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		try {
			// 分页查询数据
			modelAndView.addObject("pageList", studentService.find(super.getQueryForSchool("schoolId", user.getSchoolId()),Student.class));
			
//			modelAndView.addObject("listClasses", this.classesService.findBySchoolId(ss.getId()));
		} catch (Exception e) {
			log.info(e.getMessage(),e.toString());
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
		modelAndView.setViewName("redirect:/student/list");
		try {
			if (!id.isEmpty() && !id.equals("0")) {// 删除
				log.info("ID删除");
				Student s = studentService.findOneById(id, Student.class);
				studentService.remove(s);

			} else if (!ids.isEmpty() && !ids.equals("0")) {
				// 批量删除
				log.info("批量删除");
				String[] idsStr = ids.split(",");
				for (String galleryIds : idsStr) {
					Student s = studentService.findOneById(galleryIds,Student.class);
					studentService.remove(s);
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
	 
	 * @return
	 */
	@RequestMapping(value = "/createOrUpdateToFind", method = RequestMethod.POST)
	public ModelAndView createOrUpdateToFind(String id,
			String classesId,String name,String age,
			String nativePlace, String sex, Integer entranceYear, 
			String cardId,String fileCode,
			String code,String address,String health,String contactsPerson,
			String contactsPhone,String contactsmobile,String remark,HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/student/list");
		User user=(User) session.getAttribute(CommonEnum.LOGINUSER);//将用户对象保存到session中
		try {
			//
			Student s = null;
			if (id == null || id.equals("")) {// 添加信息
				s = new Student();// 如果为空，初始化对象
				s.setSchoolId(user.getSchoolId());
				s.setClassesId(classesId);
				s.setName(name);
				s.setSex(sex);
				s.setEntranceYear(String.valueOf(entranceYear));
				s.setCardId(cardId);
				s.setFileCode(fileCode);
				s.setNativePlace(nativePlace);
				s.setCode(code);
				s.setAddress(address);
				s.setHealth(health);
				s.setContactsPerson(contactsPerson);
				s.setContactsmobile(contactsmobile);
				s.setContactsPhone(contactsPhone);
//				float a=Float.valueOf(age);
//				Integer ages=(int) a;
//				s.setAge(ages);
				s.setRemark(remark);
				studentService.insert(s);//添加记录
			} else {// 更新信息
				s = studentService.findOneById(id,Student.class);// 查找到当前记录.
				if (s == null)
					s = new Student();// 如果为空，初始化对象
				s.setSchoolId(user.getSchoolId());
				s.setClassesId(classesId);
				s.setName(name);
				s.setSex(sex);
				s.setEntranceYear(String.valueOf(entranceYear));
				s.setCardId(cardId);
				s.setFileCode(fileCode);
				s.setNativePlace(nativePlace);
				s.setCode(code);
				s.setAddress(address);
				s.setHealth(health);
				s.setContactsPerson(contactsPerson);
				s.setContactsmobile(contactsmobile);
				s.setContactsPhone(contactsPhone);
				s.setRemark(remark);
//				float a=Float.valueOf(age);
//				Integer ages=(int) a;
//				s.setAge(ages);
				studentService.save(s);//添加记录
			}

		} catch (Exception e) {
			e.printStackTrace();
		}// 添加记录
		return modelAndView;
	}
	
	
	/**
	 * 检查编号
	 */
	@RequestMapping(value = "ajaxCheckIsIds", method = RequestMethod.POST)
	public void ajaxCheckIsIds(String ids, PrintWriter printWriter,
			HttpSession session) {}
	
	
	
	public String paramClassesNnuGetClassesid(List<Classes> list,String num){
		for(Classes c:list){
			if(c.getClassesnum().equals(num)){
				return c.getId();
			}
		}
		return null;
		
	}
	
	/***
	 * 文件上传
	 * @param request
	 * @return
	 * @throws Exception
	 */
//	@SuppressWarnings({ "static-access", "unused" })
//	@RequestMapping(value = "uploadStudent")  
//    public ModelAndView uploadStudent(HttpServletRequest request,HttpSession session,RedirectAttributes attr) throws Exception { 
//		School ss=(School) session.getAttribute("SSchool");
//		Query queryClasses=this.craeteQueryWhere("schoolId",ss.getId());
//		List<Classes> listClasses=this.classesService.find(queryClasses,Classes.class);//获取到当前学校所有的班级
//		
//		
//		//Excle 对象
//		FileOperateUtil f=new FileOperateUtil();
//		ExcelReadUtil ex=new ExcelReadUtil();
//		
//		
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("redirect:/student/list");
//		String errorMessage="";//错误信息
//        try{
//		Map<String, Object> map = new HashMap<String, Object>();  
//        // 别名  
//        String[] alaises = ServletRequestUtils.getStringParameters(request,  
//                "uploadStudent");  
//        String upname="WEB-INF/app-school/temploat/upload";
//  
//        String[] params = new String[] { "uploadStudent" };  
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
//     		    		   Student s=new Student();
//     		    		   s.setSchoolId(ss.getId());
//     		    		   s.setName(resultexcel[i][j++]);
//     		    		   s.setClassesId(paramClassesNnuGetClassesid(listClasses,resultexcel[i][j++]));
//     		    		   s.setNativePlace(resultexcel[i][j++]);
//     		    		   s.setSex(resultexcel[i][j++]);
//     		    		   
//     		    		  float tempAge=Float.valueOf( resultexcel[i][j++]);
//     		    		   s.setAge((int) tempAge);
//     		    		   s.setCardId(resultexcel[i][j++]);// 身份证Id（证件号）
//     		    		   s.setFileCode(resultexcel[i][j++]);// 学籍号
//     		    		   s.setCode(resultexcel[i][j++]);//学号
//     		    		   s.setEntranceYear(resultexcel[i][j++]);
//     		    		   s.setAddress(resultexcel[i][j++]);
//     		    		   s.setHealth(resultexcel[i][j++]);
//     		    		   s.setContactsPerson(resultexcel[i][j++]);
//     		    		   s.setContactsPhone(resultexcel[i][j++]);
//     		    		   s.setContactsmobile(resultexcel[i][j++]);
//     		    		   s.setRemark(resultexcel[i][j++]);
////     		    		   
//    		    		   this.studentService.save(s);//保存
//
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
//           return new ModelAndView("redirect:/student/list"); 
//     		     //  return modelAndView;
//        }
//        }catch(Exception e){
//        	modelAndView.addObject("error", e);
//        	 return new ModelAndView("redirect:/student/list"); 
//        }
//        return modelAndView;
//    }  

}
