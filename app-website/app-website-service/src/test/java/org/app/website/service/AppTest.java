package org.app.website.service;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cored.website.pojo.News;
import com.cored.website.service.NewsService;

/**
 * Unit test for simple App.
 */
public class AppTest {
	public ApplicationContext context;
    //@Before
	public void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext(
				"application-config.xml");
	}
	//@Test
	public void insertnews(){
		//14486934114830
		NewsService service=context.getBean(NewsService.class);
		News news=new News();
		news.setAuthor("刘文仲");
		news.setCreateTime(new Date());
		news.setModuleId("14486934114830");
		news.setSchoolId("cored");
		news.setBrowseTimes(0);
		news.setContent("当前这是一个测试的");
		news.setTitle("这是一个新的title");
		news.setState(0);
		service.insert(news);
	}

}
