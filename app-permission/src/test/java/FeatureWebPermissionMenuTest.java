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
 * 主网站菜单初始化.
 * @author mac
 *
 */
public class FeatureWebPermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;
//	特色网站  feature
//	课程首页
//	活动新闻
//	课程资源
//		"科目设计","讲义","活动视频"
//	课程管理
//		"七色花","乡村少年宫","拓展型","新生入学"
//	成果展示
//		"学生作品","获奖证书"
//	校本研修
//		"培训学习","主题研讨","主题科研"
//	师生风采
//		"教师风采","学生风采"
	
	//课程资源
	private String []ST={"科目设计","讲义","活动视频"};
	private String []STCSS={"icon-tag","icon-social-dropbox","icon-user-female"};
	private String []SU={"null","null","null"};
	
	//课程管理
	private String []NT={"七色花","乡村少年宫","拓展型","新生入学"};
	private String []NTSS={"icon-tag","icon-social-dropbox","icon-user-female","icon-user-female"};
	private String []NU={"null","null","null","null"};
	
	//成果展示
	private String[] MT = {"学生作品","获奖证书"};
	private String[] MTCSS = { "icon-users", " icon-notebook"};
	private String[] MU = { "null", "null"};
	
	
	//校本研修
	private String []XT={"培训学习","主题研讨","主题科研"};
	private String []XTCSS={ "icon-users", " icon-notebook", "icon-user"};
	private String []XU={ "null", "null","null"};
	
	//师生风采
	private String []JT={"教师风采","学生风采"};
	private String []JTCSS={ "icon-users", "icon-notebook"};
	private String []JU={ "null", "null"};
	
	
	private List<PermissionSubMenu> s=new ArrayList<PermissionSubMenu>();//课程资源
	private List<PermissionSubMenu> n=new ArrayList<PermissionSubMenu>();//课程管理
	private List<PermissionSubMenu> m=new ArrayList<PermissionSubMenu>();//成果展示
	private List<PermissionSubMenu> x=new ArrayList<PermissionSubMenu>();//校本研修
	private List<PermissionSubMenu> j=new ArrayList<PermissionSubMenu>();//师生风采
	
	//随机生成ID
			public static String getAutoId(){
				java.util.Random random=new java.util.Random();// 定义随机类
				int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
				return String.valueOf(new Date().getTime())+result;
			}
	
	
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
		for (int i = 0; i < ST.length; i++) {//课程资源
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(ST[i]);
			psm.setMenuUrl(SU[i]+"/list");
			psm.setIcon(STCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			s.add(psm);
		}
		
		for (int i = 0; i < NT.length; i++) {//课程管理
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(NT[i]);
			psm.setMenuUrl(NU[i]+"/list");
			psm.setIcon(NTSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			n.add(psm);
		}
		
		
		for (int i = 0; i < MT.length; i++) {//成果展示
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(MT[i]);
			psm.setMenuUrl(MU[i]+"/list");
			psm.setIcon(MTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			m.add(psm);
		}
		
		for (int i = 0; i < XT.length; i++) {//校本研修
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XT[i]);
			psm.setMenuUrl(XU[i]+"/list");
			psm.setIcon(XTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			x.add(psm);
		}
		for (int i = 0; i < JT.length; i++) {//师生风采
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(JT[i]);
			psm.setMenuUrl(JU[i]+"/list");
			psm.setIcon(JTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			j.add(psm);
		}
		
		
		
	
	}

	//@Test
	public void TestInsert() {
		try {
			permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuService");
		List<PermissionSubMenu> lsm = new ArrayList<PermissionSubMenu>();
			
			System.out.println(permissionMenuService);
			
			
			
			// 添加工菜单
			PermissionMenu school = new PermissionMenu();
			school.setMenuName("特色网站,特色课");
			school.setMenuType(null);
			school.setMenuUrl("http://www.zhongchiedu.com/");
			school.setOrderby(1);
			school.setIcon(null);
			school.setPid(null);
			//主网站的一级菜单有：
//			特色网站  feature
//			"课程首页","活动新闻","课程资源","课程管理","成果展示","校本研修","师生风采"
			String []xt={"课程首页","活动新闻","课程资源","课程管理","成果展示","校本研修","师生风采"};
			String []xtCSS={"icon-home","icon-note","icon-note","icon-home","icon-note","icon-home","icon-note"};
			String []xtURL={"featureWeb/index","no","#","#","#","#","#"};
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
				if(xt[i].equals("课程资源"))
				psm.setListPermissionSubMenu(s);
				if(xt[i].equals("课程管理"))
				psm.setListPermissionSubMenu(n);
				if(xt[i].equals("成果展示"))
					psm.setListPermissionSubMenu(m);
				if(xt[i].equals("校本研修"))
					psm.setListPermissionSubMenu(x);
				if(xt[i].equals("师生风采"))
					psm.setListPermissionSubMenu(j);
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
