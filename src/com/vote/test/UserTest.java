package com.vote.test;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vote.model.User;
import com.vote.service.UserService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class UserTest {
    @Autowired
    private UserService userService;

    @Autowired
    private User user;
    
    //测试根据ID查用户信息
    @Test
    public void testUser() {
        System.out.println(userService.getUserNameById("qq123456"));

    }
    
    //测试根据更改密码。
    @Test
    public void testUpdatePassword() {
    	user.setUserId("qq7878");
    	user.setUserName("小艾");
    	user.setUserAge(18);
    	user.setUserEmail("9869@sina.com");
    	user.setUserAddress("Japan");
    	System.out.println(userService.updateUserInfo(user));

    }
    
    //根据id删除用户测试
    @Test
    public void testDeleteUser() {
    	System.out.println(userService.deleteUserById("qq7878"));

    }
    
    //根据id删除用户测试
    @Test
    public void testAddUser() {
    	user.setUserId("test1");
    	user.setUserName("李云迪");
    	user.setUserAge(35);
    	user.setUserEmail("76558@sina.com");
    	user.setUserSex("男");
    	user.setUserAddress("中国重庆");
    	System.out.println(userService.addUser(user));

    }
    
    //测试获取所有用户信息
    @Test
    public void testGetAllUserInfo() {
    	List<User> userList = userService.getAllUserInfo();
    	for(User u : userList)
    		System.out.println(u);

    }
}