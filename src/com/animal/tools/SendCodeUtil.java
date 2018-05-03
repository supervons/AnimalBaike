package com.animal.tools;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSON;
/**
 * 发送验证码工具类，分为阿里云和网易云版本。
 * @author supervons
 *
 */
public class SendCodeUtil {
	/**
	 * 发送验证码阿里云版本，没有动物百科签名
	 * @param phoneNum 手机号码
	 * @param codeLength 验证码长度
	 * @param flag 两种情况，true：纯数字，false：数字+大小写字母
	 * @return 返回map对象，其中包含验证码code，状态码status，信息msg,此验证码需要自己生成
	 */
	public static Map<String, Object> sendCodeAliYun(String phoneNum,int codeLength,boolean flag){
	    String host = "https://fesms.market.alicloudapi.com";//短信发送接口
	    String path = "/sms/";
	    String method = "GET";//get方式
	    String appcode = "";//密钥
	    Map<String, String> headers = new HashMap<String, String>();
	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
	    headers.put("Authorization", "APPCODE " + appcode);
	    Map<String, String> querys = new HashMap<String, String>();
	    String code = GetRandonNumberUtil.getNumRandom(codeLength,flag);//随机生成验证码,后面的参数为是否纯数字，true为纯数字
	    querys.put("code",code);
	    querys.put("phone", phoneNum);
	    querys.put("skin", "5");
		Map<String,Object> resultMap = new HashMap<String,Object>();//返回数据的map
	    try {
	    	/**
	    	* 重要提示如下:
	    	* HttpUtils请从
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
	    	* 下载
	    	*
	    	* 相应的依赖请参照
	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
	    	*/
	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
	    	//获取response的body
	    	String responseMap = EntityUtils.toString(response.getEntity());
	    	Map<String,String> map= (Map<String, String>) JSON.parse(responseMap);//获取返回值信息，转为MAP
    		Logger logger = LogManager.getLogger(SendCodeUtil.class.getName());
	    	String resultCode = map.get("Code");
        	if(resultCode.equals("OK")){
        		logger.info(map.toString());//日志级别为info则输出
        		resultMap.put("status", "SUCCESS");
        		resultMap.put("code", code);//返回验证码
        		resultMap.put("msg", map.get("Message"));
        	}
        	else{
        		logger.info(map.toString());//日志级别为info则输出
        		resultMap.put("status", "ERROR");
        		resultMap.put("msg", map.get("Message"));
        	}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
		return resultMap;
	}
	/**
	 * 发送验证码，网易云版本，带动物百科签名
	 * @param phoneNum 手机号码
	 * @param codeLength 验证码长度
	 * @return 返回map对象，其中包含验证码code，状态码status，信息msg,此验证码为网易云平台生成
	 * @throws ClientProtocolException
	 * @throws IOException
	 */
	public static Map<String, Object> sendCodeNetease(String phoneNum,String codeLength){
	    //发送验证码的请求路径URL
	    String SERVER_URL="https://api.netease.im/sms/sendcode.action";
	    //网易云信分配的账号，请替换你在管理后台应用下申请的Appkey
	    String APP_KEY="";
	    //网易云信分配的密钥，请替换你在管理后台应用下申请的appSecret
	    String APP_SECRET="";
	    //随机数
	    String NONCE="123456";
	    //短信模板ID
	    String TEMPLATEID="3942799";
	    //手机号
	    String MOBILE=phoneNum;
	    //验证码长度，范围4～10，默认为4
	    String CODELEN=codeLength;
	    DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);
        /*
         * 参考计算CheckSum的java代码，在上述文档的参数列表中，有CheckSum的计算文档示例
         */
        String checkSum = CheckSumBuilder.getCheckSum(APP_SECRET, NONCE, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", APP_KEY);
        httpPost.addHeader("Nonce", NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        /*
         * 1.如果是模板短信，请注意参数mobile是有s的，详细参数配置请参考“发送模板短信文档”
         * 2.参数格式是jsonArray的格式，例如 "['13888888888','13666666666']"
         * 3.params是根据你模板里面有几个参数，那里面的参数也是jsonArray格式
         */
        nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", MOBILE));
        nvps.add(new BasicNameValuePair("codeLen", CODELEN));
        //返回数据的map
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
        try{
            httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

            // 执行请求
            HttpResponse response = httpClient.execute(httpPost);
            /*
             * 1.打印执行结果，打印结果一般会200、315、403、404、413、414、500
             * 2.具体的code有问题的可以参考官网的Code状态表
             */
            String responseMap = EntityUtils.toString(response.getEntity(), "utf-8");
            //获取返回值信息，转为MAP
        	Map<String,String> map= (Map<String, String>) JSON.parse(responseMap);
        	String resultCode = String.valueOf(map.get("code"));
    		Logger logger = LogManager.getLogger(SendCodeUtil.class.getName());
        	if(resultCode.equals("200")){
        		//日志级别为info则输出
        		logger.info(map.toString());
        		//返回状态码
        		resultMap.put("status", "SUCCESS");
        		//返回验证码
        		resultMap.put("code", map.get("obj"));
        		//返回错误信息
        		resultMap.put("msg", map.get("msg"));
        	}
        	else{
        		//日志级别为info则输出
        		logger.info(map.toString());
        		resultMap.put("status", "ERROR");
        		resultMap.put("msg", map.get("msg"));
        	}
        }catch(Exception e){
        	e.printStackTrace();
        }
		return resultMap;
	}
	
}
