import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

import com.cored.permission.pojo.PermissionMenu;
import com.cored.permission.pojo.PermissionRole;
import com.cored.permission.service.PermissionMenuService;
import com.cored.permission.service.PermissionRoleService;

//@RunWith(value=spring)
/**
 * 添加微信菜单.
 * @author mac
 *
 */
public class CivilizationWebPermissionRoleTest {
	private ApplicationContext ac;

	private PermissionRoleService permissionRoleService;//角色
	private PermissionMenuService permissionMenuService;//菜单
	@Before
	public void setUp() throws Exception {
		ac = new ClassPathXmlApplicationContext("permission-application-config.xml");
	}

	
	//@Test
	public void TestInsert() {
		PermissionRole pr=new PermissionRole();
		try {
			permissionRoleService = (PermissionRoleService) ac.getBean("permissionRoleService");
			permissionMenuService = (PermissionMenuService) ac.getBean("permissionMenuService");
			
			Query query=new Query();
			query.addCriteria(Criteria.where("id").is("5caae92cac8335cdf986f034"));
			//1，加微信所有菜单,
			pr.setRoleName("FuShang-School");
			pr.setRemark("福山－外语节");
			pr.setListMenu(permissionMenuService.find(query,PermissionMenu.class));
			
			permissionRoleService.insert(pr);
			
			System.out.println(permissionRoleService);
			System.out.println("craete role success");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
