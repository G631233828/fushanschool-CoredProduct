package com.cored.framework.util;

public interface CommonEnum {
	/**
	 * session常量
	 */
	public static final String WEBSCHOOLMENU="webSchoolMenu";
	/**
	 * webschool上传路径
	 */
	public static final String WEBSCHOOLFILEPATH="files";
	
	public static final String OK="ok";
	public static final String ERROR="error";
	String LOGINUSER="loginUser";//用户登录“User”对象session.
	
	
	
	//webMenu 分别定几个web菜单读取出来和到session中
	String WEBMAINSESSION="webMaminSession";
	//webMenu 信息资源库
	String WEBMRSESSION="webMRSession";
	//web Men 特色网站
	String WEBFEATURESESSION="featureSession";
	//webMenu 乡村少年宫 ruralChildrenPalaceWeb
	String WEBRCPWSESSION="ruralChildrenPalaceSession";
	
	//webMenu 文明创建 civilization
		String WEBCIVILIZATIONSESSION="fuShangSchoolSession";
}
