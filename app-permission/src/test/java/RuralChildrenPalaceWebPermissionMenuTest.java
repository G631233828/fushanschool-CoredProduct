import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionSubMenu;
import com.cored.permission.service.PermissionMenuService;

//@RunWith(value=spring)
/**
 * 乡村少年宫 菜单初始化
 * @author mac
 *
 */
public class RuralChildrenPalaceWebPermissionMenuTest {
	private ApplicationContext ac;

	private PermissionMenuService permissionMenuService;
//	乡村少年宫首页  RuralChildrenPalace
//	首页
//	七彩花宫苑
//	活动咨询
//	教师风采
//	学员作品
//	活动掠影
//	主任寄语
//	联系我们
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
	}

	//@Test
	public void TestInsert() {
		try {
			permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuService");
		List<PermissionSubMenu> lsm = new ArrayList<PermissionSubMenu>();
			
			System.out.println(permissionMenuService);
			
			
			
			// 添加工菜单
			PermissionMenu school = new PermissionMenu();
			school.setMenuName("乡村少年宫首页");
			school.setMenuType(null);
			school.setMenuUrl("http://www.zhongchiedu.com/");
			school.setOrderby(1);
			school.setIcon(null);
			school.setPid(null);
			//主网站的一级菜单有：
//			乡村少年宫首页  RuralChildrenPalace
//			"乡村少年宫首页","七彩花宫苑","活动咨询","教师风采","学员作品","活动掠影","主任寄语","联系我们"
			String []xt={"乡村少年宫首页","七彩花宫苑","活动咨询","教师风采","学员作品","活动掠影","主任寄语","联系我们"};
			String []xtCSS={"icon-home","icon-home","icon-note","icon-note","icon-home","icon-note","icon-home","icon-home"};
			String []xtURL={"RuralChildrenPalace/index","null","null","null","null","null","null","null"};
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
				psm.setId(String.valueOf(new Date().getTime())+i);
				
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
