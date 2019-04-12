import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionSubMenu;
import com.cored.permission.service.PermissionMenuService;

//@RunWith(value=spring)
/**
 * 信息资源库 菜单初始化
 * @author mac
 *
 */
public class MessageRepositoryWebPermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;
//	信息资源库
//	首页（无需上传东西）
//	微问题
//	微名课
//	微切片
//	微序段
//	微课程
//	学习园地
//		"情报信息","软件学习","它山之石","校本教材","名师课堂","专家讲座"
	
	
	//学习园地
	private String []ST={"情报信息","软件学习","它山之石","校本教材","名师课堂","专家讲座"};
	private String []STCSS={"icon-tag","icon-tag","icon-social-dropbox","icon-user-female,icon-tag","icon-social-dropbox","icon-user-female"};
	private String []SU={"null","null","null","null","null","null"};
	
	private List<PermissionSubMenu> s=new ArrayList<PermissionSubMenu>();//学习园地
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
		for (int i = 0; i < ST.length; i++) {//学习园地
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(ST[i]);
			psm.setMenuUrl(SU[i]+"/list");
			psm.setIcon(STCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			s.add(psm);
		}
		
		
	
	}
	//随机生成ID
	public static String getAutoId(){
		java.util.Random random=new java.util.Random();// 定义随机类
		int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
		return String.valueOf(new Date().getTime())+result;
	}
	//@Test
	public void TestInsert() {
		try {
			permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuService");
		List<PermissionSubMenu> lsm = new ArrayList<PermissionSubMenu>();
			
			System.out.println(permissionMenuService);
			
			
			
			// 添加工菜单
			PermissionMenu school = new PermissionMenu();
			school.setMenuName("信息资源库");
			school.setMenuType(null);
			school.setMenuUrl("http://www.zhongchiedu.com/");
			school.setOrderby(1);
			school.setIcon(null);
			school.setPid(null);
			//主网站的一级菜单有：
//			信息资源库
//			"首页","微问题","微名课","微切片","微序段","微课程","学习园地"
			String []xt={"首页","微问题","微名课","微切片","微序段","微课程","学习园地"};
			String []xtCSS={"icon-home","icon-note","icon-note","icon-home","icon-note","icon-home","icon-home"};
			String []xtURL={"MessageRepository/index","null","null","null","null","null","#"};
			List<PermissionSubMenu> menul=new ArrayList<PermissionSubMenu>();
			
			for(int i=0;i<xt.length;i++){
				PermissionSubMenu psm = new PermissionSubMenu();
				psm.setMenuName(xt[i]);
				psm.setMenuUrl(xtURL[i]);
				psm.setIcon(xtCSS[i]);
				if(xtURL[i].equals("#"))
					psm.setMenuType("2");//有只菜单
				else
					psm.setMenuType("1");//无子菜单
				psm.setOrderby(i);
				psm.setId(getAutoId()+i);
				if(xt[i].equals("学习园地"))
					psm.setListPermissionSubMenu(s);
				
				menul.add(psm);
				
			}
			
			
			school.setListPermissionSubMenu(menul);
			
			permissionMenuService.insert(school);
			
			
		
	
		
		
	//添加超级管理员（教育局帐号，云平台管理帐号）
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
	

}
