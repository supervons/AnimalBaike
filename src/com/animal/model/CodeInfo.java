package com.animal.model;

import java.util.Date;

/**
 * 验证码表，包含手机号，验证码和验证码状态，发送时间。
 */
import org.springframework.stereotype.Component;

@Component
public class CodeInfo {
	private String codeId;
	private String PhoneNum;
	private String CodeNum;
	private String codeStatus;
	private Date sendTime;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;

	public String getCodeId() {
		return codeId;
	}

	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	public String getPhoneNum() {
		return PhoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		PhoneNum = phoneNum;
	}

	public String getCodeNum() {
		return CodeNum;
	}

	public void setCodeNum(String codeNum) {
		CodeNum = codeNum;
	}

	public String getCodeStatus() {
		return codeStatus;
	}

	public void setCodeStatus(String codeStatus) {
		this.codeStatus = codeStatus;
	}

	public Date getSendTime() {
		return sendTime;
	}

	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}

	public String getReserveField1() {
		return reserveField1;
	}

	public void setReserveField1(String reserveField1) {
		this.reserveField1 = reserveField1;
	}

	public String getReserveField2() {
		return reserveField2;
	}

	public void setReserveField2(String reserveField2) {
		this.reserveField2 = reserveField2;
	}

	public String getReserveField3() {
		return reserveField3;
	}

	public void setReserveField3(String reserveField3) {
		this.reserveField3 = reserveField3;
	}

	@Override
	public String toString() {
		return "CodeInfo [codeId=" + codeId + ", PhoneNum=" + PhoneNum
				+ ", CodeNum=" + CodeNum + ", codeStatus=" + codeStatus
				+ ", sendTime=" + sendTime + ", reserveField1=" + reserveField1
				+ ", reserveField2=" + reserveField2 + ", reserveField3="
				+ reserveField3 + "]";
	}

}
