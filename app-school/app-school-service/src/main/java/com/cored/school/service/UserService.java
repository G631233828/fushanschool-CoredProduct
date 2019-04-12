package com.cored.school.service;

import org.springframework.stereotype.Repository;

import com.cored.framework.service.GeneralServiceImpl;
import com.cored.school.pojo.User;

@Repository("userService")
public class UserService extends GeneralServiceImpl<User> {
	
}
