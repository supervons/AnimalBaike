package com.animal.model;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class UserInfo{
	private String userId;
	private String userName;
	private int userAge;
	private String userSex;
	private String userTel;
	private String userAddress;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
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
		return "UserInfo [userId=" + userId + ", userName=" + userName
				+ ", userAge=" + userAge + ", userSex=" + userSex
				+ ", userTel=" + userTel + ", userAddress=" + userAddress
				+ ", reserveField1=" + reserveField1 + ", reserveField2="
				+ reserveField2 + ", reserveField3=" + reserveField3 + "]";
	}
}
