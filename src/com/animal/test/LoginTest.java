package com.animal.test;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.animal.model.Login;
import com.animal.service.LoginService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class LoginTest {
    @Autowired
    private LoginService loginService;

    @Autowired
    private Login login;

    //测试用户登录
    @Test
    public void testLogin() {
//    	Admin admin = new Admin();
    	login.setUserId("qq123456");
    	login.setUserPassword("123456");
        System.out.println(loginService.isLogin(login)!=null?"登录成功":"登录失败");

    }
    
    //测试根据id，旧密码更改密码。
    @Test
    public void testUpdatePassword() {
//    	Admin admin = new Admin();    	
        System.out.println(loginService.updatePassword("qq123456","123456","456789"));

    }
    
    //测试根据id，旧密码更改密码。
    @Test
    public void resetUserPassword() {
        System.out.println(loginService.resetUserPassword("qq123456"));

    }
    
    //测试根据id，旧密码更改密码。
    @Test
    public void testAddNewLogin() {
    	Login login = new Login();
		login.setUserId("qq56456");
		login.setUserPassword("123");
		login.setUserIdentity(1);
		login.setUserRegitime(new Date());
		loginService.addNewUser(login);		
    }
}