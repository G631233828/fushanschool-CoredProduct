package com.cored.school.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cored.framework.util.CommonEnum;
import com.cored.school.util.Constant;





/**
 * 
 * 
 * @category
 * 登录时候的拦截器
 * 
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final Logger LOG = LoggerFactory
			.getLogger(LoginInterceptor.class);

	/**
	 * 在Controller方法前进行拦截<br>
	 * 如果返回false <br>
	 * 从当前拦截器往回执行所有拦截器的afterCompletion方法,再退出拦截器链.<br>
	 * 如果返回true<br>
	 * 执行下一个拦截器,直到所有拦截器都执行完毕. 再运行被拦截的Controller.<br>
	 * 然后进入拦截器链,从最后一个拦截器往回运行所有拦截器的postHandle方法.<br>
	 * 接着依旧是从最后一个拦截器往回执行所有拦截器的afterCompletion方法.
	 */

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String url = request.getRequestURL().toString();
//		LOG.info("请求:" + url);
//		LOG.info("访问者IPss：" + request.getRemoteAddr());
//		LOG.info("访问者IP：" + request.getRemoteAddr());
		HttpSession session = request.getSession();
		
//		if(request.getParameter("activeMenu")!=null && !request.getParameter("activeMenu").equals("")){
//			//将这个地址保存的session中。
////			LOG.info("菜单标识号"+request.getParameter("activeMenu"));
//			session.setAttribute("activeMenu", request.getParameter("activeMenu"));
//		}
		
		
		if (session.getAttribute(CommonEnum.LOGINUSER) != null) {
			return true;
		}
		if(url.indexOf("assets")!=-1 || url.indexOf("public")!=-1){
			return true;
		}
		
		
		//判断请求是AJAX请求还是普通请求
		String requestType=request.getHeader("X-Requested-With");
		if(requestType!=null&&requestType.equals("XMLHttpRequest")){
			response.setContentType("json/application");
			response.setCharacterEncoding("utf-8");
			return false;
		}
		session.setAttribute(Constant.USR_UNAUTH, "登录过期请重新登录");
		System.out.println(request.getContextPath());
		response.sendRedirect(request.getContextPath()+"/user/login");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	/**
	 * 在Controller方法后进行拦截 <br>
	 * 当有拦截器抛出异常时,会从当前拦截器往回执行所有拦截器的afterCompletion方法 <br>
	 */
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}
