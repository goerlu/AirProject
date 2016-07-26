package com.integration.test;

import java.util.Iterator;
import java.util.List;

import com.integration.entity.User;
import com.integration.service.UserService;

import junit.framework.TestCase;

public class TestService extends TestCase {
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@org.junit.Test
	public void Test() {
		String username="lili";
		String password="lili";
		String usertype="1";
		System.out.print("1");
		List<User> list = (List<User>) userService.findAll();
		User u = new User();
		Iterator<User> it=list.iterator(); 
		String page = "failer";
		while(it.hasNext()){
			 u = (User)it.next();
			 if(username.trim().equals(u.getName())&&password.trim().equals(u.getPassword())&&usertype.trim().equals(u.getType())){
				 page="success"; 
			 }
				 
		}	 
	}
}
