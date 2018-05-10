package com.animal.tools;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.UUID;

import org.apache.commons.lang3.RandomUtils;
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
		Map<String,Integer> map = new TreeMap<String,Integer>();
		map.put("张三", 5);
		map.put("李四", 1);
		map.put("王二", 3);
		System.out.println();
		//这里将map.entrySet()转换成list
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());
        //然后通过比较器来实现排序
        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Entry<String, Integer> o1,
                    Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
            
        });
        
//        for(Map.Entry<String,Integer> mapping:list){ 
//               System.out.println(mapping.getKey()+":"+mapping.getValue()); 
//          } 
		for (int i = list.size() - 1; i >= 0; i--) {
			System.out.println(list.get(i).getKey());
		}
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
	
	//将map根据value值大小排行，升序。
	public static List<Entry<String, Integer>> sortMap(Map<String,Integer> map){
		//这里将map.entrySet()转换成list
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());
        //然后通过比较器来实现排序
        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Entry<String, Integer> o1,
                    Entry<String, Integer> o2) {
                return o1.getValue().compareTo(o2.getValue());
            }
            
        });
        return list;
	}
	/**
	 * 生成指定区间，指定个数的随机数
	 * @param begin 随机数开始范围
	 * @param end 随机数结束范围
	 * @param num 随机数个数
	 * @return
	 */
	public static Set<Integer> getRandomNumber(int begin , int end , int num){
    	//记录五个随机数
    	Set<Integer> result= new LinkedHashSet<Integer>();
    	while(result.size()<num){
        	result.add(RandomUtils.nextInt(begin,end));//从0，到排行榜的长度
    	}
    	return result;
	}
}
