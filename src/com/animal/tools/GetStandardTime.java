package com.animal.tools;

import java.io.IOException;
import java.net.InetAddress;
import java.net.SocketException;
import java.util.Date;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

public class GetStandardTime {
	//设置NET服务器时间地址，这里是北京的服务器.
	public static String ServerIP = "202.108.6.95";

	//获取服务器的标准北京时间
	public static Date getStandardTime() throws IOException {

		NTPUDPClient client = new NTPUDPClient();
		//响应延迟时间
		client.setDefaultTimeout(10000);
		try {
			client.open();
			InetAddress hostAddr = InetAddress.getByName(ServerIP);	
			TimeInfo info = client.getTime(hostAddr);
			Date date = new java.util.Date(info.getReturnTime());
			return date;
			// processResponse(info);
		} catch (SocketException e) {
			e.printStackTrace();
		}
		client.close();
		return null;
	}

}
