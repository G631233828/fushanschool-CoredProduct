package snippet;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.mongodb.core.query.Query;

import com.cored.permission.service.PermissionRoleService;
import com.cored.school.pojo.User;
import com.cored.school.pojo.User.userType;
import com.cored.school.pojo.UserRole;
import com.cored.school.service.UserRoleService;
import com.cored.school.service.UserService;

//@RunWith(value=spring)

public class UserTest {
	private ApplicationContext ac; 
	
	private UserService userService;//用户
	private PermissionRoleService pRole;//角色
	
	private UserRoleService userRoleService;//用户角色管理
	
	@Before 
    public void setUp() throws Exception{ 
        ac = new ClassPathXmlApplicationContext("school-application-config.xml");
	}
   //@Test
    public void TestUpdateRole(){
    	userRoleService=(UserRoleService) ac.getBean("userRoleService");
    	List<UserRole> l=this.userRoleService.find(new Query(), UserRole.class);
    	System.out.println(l.size());
    	for(UserRole ur:l){
    		System.out.println(ur.getName());
    	}
    	
    	
    }
    
    
	//@Test
	public void TestInsert(){
		try{
		userService=(UserService) ac.getBean("userService");
		
		pRole = (PermissionRoleService) ac.getBean("permissionRoleService");
		
		
		User wzu=new User();
		wzu.setUsername("cored");
		wzu.setPassword("cored");
		wzu.setRole("5575315c36705ad978fecedb");
		wzu.setWeChatCode("aaronTest_WeChatId");
		wzu.setRemark("WeChat Test User");
		wzu.setType(userType.superManager);
		wzu.setSchoolId("cored");
		wzu.setSchooldIds("cored");
		userService.insert(wzu);
		System.out.println("管理员");
		}catch(Exception e){
			e.printStackTrace();
//			System.out.println(e);
		}
		
		
		
	}

}
