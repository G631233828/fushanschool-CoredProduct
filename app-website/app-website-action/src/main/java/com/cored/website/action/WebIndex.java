package com.cored.website.action;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cored.framework.action.GeneralAction;
import com.cored.website.pojo.News;

@Controller
@RequestMapping("")
public class WebIndex  extends GeneralAction<News> {
	private static final Logger log = LoggerFactory
			.getLogger(News.class);
	
	@RequestMapping("")
	public ModelAndView webindex(HttpSession session) {
		log.info("首页");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/web/civilization/index");
		return modelAndView;
	}
	

	
}
