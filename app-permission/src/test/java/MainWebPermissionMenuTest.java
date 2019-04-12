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
public class MainWebPermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;
//	主网站
//
//	首页（无需上传东西）
//	学校概况
//		"校长寄语", "学校介绍", "领导机构"
//	校园动态
//		"校园新闻", "每周工作", "各类通知"
//	信息公开
//		"单位概况","计划总结", "单位业务","文件下载","其他"
//	党建园地
//		"文明创建","学习园地", "党务公开", "师德建设","党员风采"
//	课程教学
//		"教学常规","教研活动","教案精选","备课系统","选课系统"
//	教师发展
//		"队伍建设","教研科研","成长档案"
//	德育经纬
//		"活动天地","班主任之家","家校互动","社区天地","信息直通车"
//	雏鹰成长
//		"七彩活动展","队知识宣讲","光荣护旗手","七色花少年","班级小岗位"
//	特色网站
//		"文明创建","特色课程","乡村少年宫","微视频"
//	荣誉长廊
//		"学校荣誉","班级荣誉","教师荣誉","学生荣誉"	
//	信息资源
	
	//学校概况
	private String []ST={"校长寄语", "学校介绍", "领导机构"};
	private String []STCSS={"icon-tag","icon-social-dropbox","icon-user-female"};
	private String []SU={"null","null","null"};
	
	//校园动态
	private String []NT={"校园新闻", "每周工作", "各类通知"};
	private String []NTSS={"icon-tag","icon-social-dropbox","icon-user-female"};
	private String []NU={"null","null","null"};
	
	//信息公开
	private String[] MT = {"单位概况","计划总结", "单位业务","文件下载","其他"};
	private String[] MTCSS = { "icon-users", " icon-notebook", "icon-user","icon-notebook", "icon-user" };
	private String[] MU = { "null", "null","null","null","null"};
	
	
	//党建园地
	private String []XT={"文明创建","学习园地", "党务公开", "师德建设","党员风采"};
	private String []XTCSS={ "icon-users", " icon-notebook", "icon-user","icon-notebook", "icon-user" };
	private String []XU={ "null", "null","null","null","null"};
//	课程教学
//	"教学常规","教研活动","教案精选","备课系统","选课系统"
	private String []XKCT={"教学常规","教研活动","教案精选","备课系统","选课系统"};
	private String []XKCCSS={ "icon-users", " icon-notebook", "icon-user","icon-notebook", "icon-user" };
	private String []XKCU={ "null", "null","null","null","null"};
//教师发展
//	"队伍建设","教研科研","成长档案"
	private String []XJST={"队伍建设","教研科研","成长档案"};
	private String []XJSCSS={ "icon-users", " icon-notebook", "icon-user"};
	private String []XJSU={ "null", "null","null"};
//德育经纬
//	"活动天地","班主任之家","家校互动","社区天地","信息直通车"
	private String []XDYT={"活动天地","班主任之家","家校互动","社区天地","信息直通车"};
	private String []XDYCSS={ "icon-users", " icon-notebook", "icon-user", "icon-notebook", "icon-user"};
	private String []XDYSU={ "null","null","null","null","null"};
	
//雏鹰成长
//	"七彩活动展","队知识宣讲","光荣护旗手","七色花少年","班级小岗位"
	private String []XXYT={"七彩活动展","队知识宣讲","光荣护旗手","七色花少年","班级小岗位"};
	private String []XXYCSS={ "icon-users", " icon-notebook", "icon-user", "icon-notebook", "icon-user"};
	private String []XDXYU={ "null","null","null","null","null"};
//特色网站
//	"文明创建","特色课程","乡村少年宫","微视频"
	private String []XTST={"文明创建","特色课程","乡村少年宫","微视频"};
	private String []XTSCSS={ "icon-users", " icon-notebook", "icon-user","icon-notebook",};
	private String []XDTSU={ "null","null","null","null"};
//荣誉长廊
//	"学校荣誉","班级荣誉","教师荣誉","学生荣誉"	
	private String []XRUT={"学校荣誉","班级荣誉","教师荣誉","学生荣誉"};
	private String []XRUCSS={ "icon-users", " icon-notebook", "icon-user","icon-notebook",};
	private String []XRUSU={ "null","null","null","null"};
	
	
	int ii=0;//维一标识，id
	
	private List<PermissionSubMenu> s=new ArrayList<PermissionSubMenu>();//学校概况
	private List<PermissionSubMenu> n=new ArrayList<PermissionSubMenu>();//校园动态
	private List<PermissionSubMenu> m=new ArrayList<PermissionSubMenu>();//信息公开
	private List<PermissionSubMenu> x=new ArrayList<PermissionSubMenu>();//党建园地
	private List<PermissionSubMenu> kc=new ArrayList<PermissionSubMenu>();//课程教学
	private List<PermissionSubMenu> js=new ArrayList<PermissionSubMenu>();//教师发展
	private List<PermissionSubMenu> dy=new ArrayList<PermissionSubMenu>();//德育经纬
	private List<PermissionSubMenu> zy=new ArrayList<PermissionSubMenu>();//雏鹰成长
	private List<PermissionSubMenu> ts=new ArrayList<PermissionSubMenu>();//特色网站
	private List<PermissionSubMenu> ru=new ArrayList<PermissionSubMenu>();//荣誉长廊
	
	//随机生成ID
		public static String getAutoId(){
			java.util.Random random=new java.util.Random();// 定义随机类
			int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
			return String.valueOf(new Date().getTime())+result;
		}
	
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
		for (int i = 0; i < XKCT.length; i++) {//课程教学
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XKCT[i]);
			psm.setMenuUrl(XKCU[i]);
			psm.setIcon(XKCCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			kc.add(psm);
		}
		
		for (int i = 0; i < XJST.length; i++) {//教师发展
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XJST[i]);
			psm.setMenuUrl(XJSCSS[i]);
			psm.setIcon(XJSU[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			js.add(psm);
		}
		
		for (int i = 0; i < XDYT.length; i++) {//德育经纬
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XDYT[i]);
			psm.setMenuUrl(XDYCSS[i]);
			psm.setIcon(XDYSU[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			dy.add(psm);
		}
		
		for (int i = 0; i < XXYT.length; i++) {//雏鹰成长
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XXYT[i]);
			psm.setMenuUrl(XXYCSS[i]);
			psm.setIcon(XDXYU[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			zy.add(psm);
		}
		
		for (int i = 0; i < XTST.length; i++) {//特色网站
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XTST[i]);
			psm.setMenuUrl(XTSCSS[i]);
			psm.setIcon(XDTSU[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			ts.add(psm);
		}
		
		for (int i = 0; i < XRUT.length; i++) {//荣誉长廊
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XRUT[i]);
			psm.setMenuUrl(XRUCSS[i]);
			psm.setIcon(XRUSU[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			ru.add(psm);
		}
		//特色网站


		
		
		
		
		
		for (int i = 0; i < ST.length; i++) {//学校概况
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(ST[i]);
			psm.setMenuUrl(SU[i]+"/list");
			psm.setIcon(STCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			s.add(psm);
		}
		
		for (int i = 0; i < NT.length; i++) {//校园动态
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(NT[i]);
			psm.setMenuUrl(NU[i]+"/list");
			psm.setIcon(NTSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			n.add(psm);
		}
		
		
		for (int i = 0; i < MT.length; i++) {//党建园地
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(MT[i]);
			psm.setMenuUrl(MU[i]+"/list");
			psm.setIcon(MTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			m.add(psm);
		}
		
		for (int i = 0; i < XT.length; i++) {//信息公开
			PermissionSubMenu psm = new PermissionSubMenu();
			psm.setMenuName(XT[i]);
			psm.setMenuUrl(XU[i]+"/list");
			psm.setIcon(XTCSS[i]);
			psm.setMenuType("1");
			psm.setOrderby(i);
			psm.setId(getAutoId()+ii++);
			x.add(psm);
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
			school.setMenuName("校园主网站");
			school.setMenuType(null);
			school.setMenuUrl("http://www.zhongchiedu.com/");
			school.setOrderby(1);
			school.setIcon(null);
			school.setPid(null);
			//主网站的一级菜单有：
			//	"首页","学校概况","校园动态","信息公开","党建园地","课程教学","教师发展","德育经纬","雏鹰成长","特色网站","荣誉长廊","信息资源"
			String []xt={"首页","学校概况","校园动态","信息公开","党建园地","课程教学","教师发展","德育经纬","雏鹰成长","特色网站","荣誉长廊","信息资源"};
			String []xtCSS={"icon-home","icon-note","icon-note","icon-home","icon-note","icon-home","icon-note","icon-note","icon-note","icon-home","icon-note","icon-note"};
			String []xtURL={"web/index","#","#","#","#","#","#","#","#","#","#","web/messageRepositoryWeb/index"};
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
				psm.setId(getAutoId()+ii++);
				
				if(xt[i].equals("学校概况"))
				psm.setListPermissionSubMenu(s);
				if(xt[i].equals("校园动态"))
				psm.setListPermissionSubMenu(n);
				if(xt[i].equals("信息公开"))
					psm.setListPermissionSubMenu(m);
				if(xt[i].equals("党建园地"))
					psm.setListPermissionSubMenu(x);
				
				if(xt[i].equals("课程教学"))
					psm.setListPermissionSubMenu(kc);
				if(xt[i].equals("教师发展"))
					psm.setListPermissionSubMenu(js);
				if(xt[i].equals("德育经纬"))
					psm.setListPermissionSubMenu(dy);
				if(xt[i].equals("雏鹰成长"))
					psm.setListPermissionSubMenu(zy);
				if(xt[i].equals("特色网站"))
					psm.setListPermissionSubMenu(ts);
				if(xt[i].equals("荣誉长廊"))
					psm.setListPermissionSubMenu(ru);
				
				menul.add(psm);
				
			}
			
			
			school.setListPermissionSubMenu(menul);
			
			permissionMenuService.insert(school);
			
			
		
	
		
		
	//添加超级管理员（教育局帐号，云平台管理帐号）
		
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
	//@Test
	public void TestInsertarea() {
		try {
			superMessageMenu();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void superMessageMenu() throws Exception{
		permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuDao");
		
		String []TName={"学校单位","信息发布","配置","统计"};
		String []TCSS={"icon-home","icon-bubbles","icon-map","icon-graph"};
		String []TU={"school","informationDelivery","config","Statistics"};
		
		
		//幼儿保教系统
				PermissionMenu kindergarten = new PermissionMenu();
				kindergarten.setMenuName("教育局平台");
				kindergarten.setId("Cored_Menu_007");
				kindergarten.setMenuType(null);
				kindergarten.setMenuUrl("http://www.zhongchiedu.com/");
				kindergarten.setOrderby(-1);
				kindergarten.setIcon(null);
				kindergarten.setPid(null);
				List<PermissionSubMenu> k=new ArrayList<PermissionSubMenu>();
				
				for(int i=0;i<TName.length;i++){
					
					PermissionSubMenu psm = new PermissionSubMenu();
					psm.setMenuName(TName[i]);
					psm.setMenuUrl(TU[i]+"/list");
					psm.setIcon(TCSS[i]);
					psm.setMenuType("1");
					psm.setOrderby(i);
					psm.setId(String.valueOf(new Date().getTime())+i);
					if(i==2){
						String []T1Name={"食谱标准","话述配置","报警配置"};
						String []T1CSS={"icon-home","icon-map","icon-pie-chart"};
						String []T1U={"school","config","kindergartenAlarmConf/editor"};
						
						List<PermissionSubMenu> subk=new ArrayList<PermissionSubMenu>();
						for(int j=0;j<T1Name.length;j++){
							PermissionSubMenu sub = new PermissionSubMenu();
							sub.setMenuName(T1Name[j]);
							sub.setMenuUrl(T1U[j]);
							sub.setIcon(T1CSS[j]);
							sub.setMenuType("1");
							sub.setOrderby(j);
							sub.setId(String.valueOf(new Date().getTime())+j+i);
							subk.add(sub);
						}
						psm.setListPermissionSubMenu(subk);
					}
					
					
					if(i==TName.length-1){
						//添加统计信息
						String []T2={"区域监控","报警单位"};
						String []T2CSS={"icon-home","icon-graph"};
						String []TU2={"kindergartenStatisticAnalyze/areaStatisticAnalyze","kindergartenAlarmStatisitcs/list"};
						List<PermissionSubMenu> subk=new ArrayList<PermissionSubMenu>();
						for(int j=0;j<T2.length;j++){
							PermissionSubMenu sub = new PermissionSubMenu();
							sub.setMenuName(T2[j]);
							sub.setMenuUrl(TU2[j]);
							sub.setIcon(T2CSS[j]);
							sub.setMenuType("1");
							sub.setOrderby(j);
							sub.setId(String.valueOf(new Date().getTime())+j+i);
							subk.add(sub);
						}
						psm.setListPermissionSubMenu(subk);
					}
					
					k.add(psm);
				}
				kindergarten.setListPermissionSubMenu(k);	
				permissionMenuService.insert(kindergarten);
	}
	

}
