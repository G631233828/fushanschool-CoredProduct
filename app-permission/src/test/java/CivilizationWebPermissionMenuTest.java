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
 * 文明创建 菜单初始化
 * @author mac
 *
 */
public class CivilizationWebPermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;

	//学科专项探究
	private String []ST={"语文","数学","英语","音乐",
						"体育","美术","自然","信息","德育"};
	private String []STCSS={"1","2","3","4","5","6","7","8","9"};
	private String []SU={"null","null","null","null","null","null","null","null",""};
		//
		private String []ST1={"活动方案","活动资料","成果展示"};
		private String []STCSS1={"icon-tag","icon-tag","icon-tag"};
		private String []SU1={"null","null","null"};
			
	
	//精彩学生活动
	private String []NT={"社会实践","探究手册展","精采活动","闭幕式视频"};
	private String []NTSS={"icon-tag","icon-tag","icon-tag","icon-tag"};
	private String []NU={"null","null","null","null"};

	
	
	private List<PermissionSubMenu> s=new ArrayList<PermissionSubMenu>();//学科专项探究
	private List<PermissionSubMenu> n=new ArrayList<PermissionSubMenu>();//精彩学生活动
	
	//随机生成ID
	public static String getAutoId(){
		java.util.Random random=new java.util.Random();// 定义随机类
		int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
		return String.valueOf(new Date().getTime())+result;
	}
	
	public static List<PermissionSubMenu> loadForMenu(String[] t ,String[] s,String[] u){
		List<PermissionSubMenu> tempList=new ArrayList<PermissionSubMenu>();
		for (int i = 0; i < t.length; i++) {//子集合
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(t[i]);
			psm.setMenuUrl(u[i]+"/list");
			psm.setIcon(s[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			tempList.add(psm);
		}
		return tempList;
	}
	
	
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
		for (int i = 0; i < ST.length; i++) {//学科专项探究
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(ST[i]);
			psm.setMenuUrl(SU[i]+"/list");
			psm.setIcon(STCSS[i]);
			psm.setMenuType("2");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
//				psm.setListPermissionSubMenu(loadForMenu(ST1,STCSS1,SU1));
			s.add(psm);
		}
		
		for (int i = 0; i < NT.length; i++) {	//精彩学生活动
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(NT[i]);
			psm.setMenuUrl(NU[i]+"/list");
			psm.setIcon(NTSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			n.add(psm);
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
			school.setMenuName("福山外语节2016");
			school.setMenuType(null);
			school.setMenuUrl("http://www.zhongchiedu.com/");
			school.setOrderby(1);
			school.setIcon(null);
			school.setPid(null);
			//主网站的一级菜单有：
			//外语节活动方案  /  学科专项研究  /  专题研究课   /   精彩学生活动   /   资源推荐
			String []xt={"外语节活动报道","活动方案","科学专题活动","活动集锦","资源推荐"};
			String []xtCSS={"icon-home","icon-note","icon-note","icon-note","icon-home"};
			String []xtURL={"no","no","#","no","no"};
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
				if(xt[i].equals("科学专题活动"))
				psm.setListPermissionSubMenu(s);
//				if(xt[i].equals("精彩学生活动"))
//				psm.setListPermissionSubMenu(n);
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
