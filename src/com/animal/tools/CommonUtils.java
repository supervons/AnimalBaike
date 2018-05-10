package com.animal.tools;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
	
	//传入其他用户的搜索数据，算出最高频率的关键字
	public static Map<String,Integer> getTopStringList(List<String> listString){
		Map<String,Integer> map = new TreeMap<String,Integer>();
		for(String word:listString){
			if(map.containsKey(word))
				map.put(word, map.get(word)+1);
			else
				map.put(word, 1);				
		}
		return map;
	}
}
