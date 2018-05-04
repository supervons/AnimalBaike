package com.animal.tools;

import java.util.UUID;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

/**
 * 通用工具类
 * @author fys
 *
 */
public class CommonUtils {
	public static void main(String args[]){
		Md5PasswordEncoder md5 = new Md5PasswordEncoder();
		String s = "123456";
		System.out.println(md5.encodePassword(s,null));
	}
	//获取去掉‘-’后的uuid
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
}
