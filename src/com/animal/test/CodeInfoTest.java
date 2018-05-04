package com.animal.test;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.animal.model.CodeInfo;
import com.animal.service.CodeInfoService;
import com.animal.tools.CommonUtils;
import com.animal.tools.GetStandardTime;
import com.animal.tools.SendCodeUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext.xml" })
public class CodeInfoTest {

    @Autowired
    private CodeInfoService codeInfoService;

    @Autowired
    private CodeInfo codeInfo;
	@Test
	public void test() {
		String phoneNum ="17611688012";
		codeInfoService.abandonCodeByPhoneNum(phoneNum);
//		Map<String, Object> resultMap = SendCodeUtil.sendCodeAliYun(phoneNum,
//				6, true, "5");
//		//获取map中的status，该状态标识是否发送成功
//		String statusResult = (String) resultMap.get("status");
//		try{
//			if (statusResult.endsWith("SUCCESS")){
//				String codeNum = (String) resultMap.get("code");
//				//生成一个实体类
//				CodeInfo codeInfo = new CodeInfo();
//				codeInfo.setCodeId(CommonUtils.getUUID());
//				codeInfo.setPhoneNum(phoneNum);
//				//该状态为标识该条验证码记录活动，同号码的其余验证码作废，详情参考data_library表
//				codeInfo.setCodeStatus("sendstatus01");
//				codeInfo.setCodeNum(codeNum);
//				codeInfo.setSendTime(GetStandardTime.getStandardTime());
//				System.out.println(codeInfoService.sendMsg(codeInfo) + " ");;
//			}
//			else
//				System.out.println((String) resultMap.get("msg"));
//		}catch(Exception e){
//			e.printStackTrace();
//		}
	}
}
