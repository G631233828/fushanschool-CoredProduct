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
 * 添加微信菜单.
 * @author mac
 *
 */
public class PermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;
	
	
	private String []ST={"部门信息","班级管理","老师管理","学生管理","科目管理","用户管理","角色管理"};
	private String []STCSS={"icon-tag","icon-social-dropbox","icon-user-female","icon-user-female","icon-user-following",
			"icon-user","icon-graduation"};
	private String []SU={"department","classes","teacher","student","subject","user","schoolPermissionRole"};
	
	
	//网站子基本信息
	private String[] MT = { "2016迪士尼文化"};
	private String[] MTCSS = { "icon-users"};
	private String[] MU = { "webSchool/list?token=FuShang-School"};
	
	
	
	
	private List<PermissionSubMenu> LweFeatures=new ArrayList<PermissionSubMenu>();//特色项目菜单。
	private List<PermissionSubMenu> Lschool=new ArrayList<PermissionSubMenu>();//学校基本模块
	
	//随机生成ID
	public static String getAutoId(){
		java.util.Random random=new java.util.Random();// 定义随机类
		int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
		return String.valueOf(new Date().getTime())+result;
	}

	
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
		
		for (int i = 0; i < MT.length; i++) {// 子网站，
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(MT[i]);
			psm.setMenuUrl(MU[i]);
			psm.setIcon(MTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			LweFeatures.add(psm);
		}
		
		for (int i = 0; i < ST.length; i++) {// 初始化学校基本信息
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(ST[i]);
			psm.setMenuUrl(SU[i]+"/list");
			psm.setIcon(STCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+i);
			Lschool.add(psm);
		}
		

	}

	//@Test
	public void TestInsert() {
		try {
			permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuService");
		List<PermissionSubMenu> lsm = new ArrayList<PermissionSubMenu>();
			
			System.out.println(permissionMenuService);
			
			
			
			// 添加微信产口模块菜单
						PermissionMenu school = new PermissionMenu();
						school.setMenuName("校园办公");
						school.setMenuType(null);
						school.setMenuUrl("http://www.zhongchiedu.com/");
						school.setOrderby(1);
						school.setIcon(null);
						school.setPid(null);
			//,"通知","我的办公区
			String []xt={"校园管理","外语节报道","特色网站"};
			String []xtCSS={"fa-th-large","fa-globe","fa-sitemap"};
			String []xtURL={"#","school/notifiction/list","#"};
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
				if(xt[i].equals("校园管理"))
				psm.setListPermissionSubMenu(Lschool);
				
				if(xt[i].equals("特色网站"))
					psm.setListPermissionSubMenu(LweFeatures);
				
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
