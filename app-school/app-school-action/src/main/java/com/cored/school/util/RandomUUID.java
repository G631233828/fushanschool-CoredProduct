package com.cored.school.util;

public class RandomUUID {
	
	public static String getAutoId(){
		java.util.Random random=new java.util.Random();// 定义随机类
		int result=random.nextInt(1000);// 返回[0,10)集合中的整数，注意不包括10
		return String.valueOf(System.currentTimeMillis())+result;
	}
}
