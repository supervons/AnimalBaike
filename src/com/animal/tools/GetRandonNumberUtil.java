package com.animal.tools;

import java.util.Random;

/**
 * 生成随机验证码等
 * 
 * @author fys
 *
 */
public class GetRandonNumberUtil {
	private static String getRandom(boolean flag) {
		String value = "";
		Random random = new Random();
		// 通过type % 2的模来判断是字符还是数字
		int type = random.nextInt(2);
		String charOrNum = flag?"num":type % 2 == 0?"char":"num";
		if ("char".equals(charOrNum)) {
			int temp = random.nextInt(2) % 2 == 0 ? 65 : 97;
			int ascii = random.nextInt(26);
			value += (char) (ascii + temp);
		} else if ("num".equals(charOrNum)) {
			value += String.valueOf(random.nextInt(10));
		}
		return value;
	}

	public static String getNumRandom(int length,boolean flag) {
		String value = "";
		if (length < 4)
			length = 4;
		for (int i = 0; i < length; i++)
			value += getRandom(flag);
		return value;
	}

}
