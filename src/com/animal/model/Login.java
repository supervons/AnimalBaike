package com.animal.model;
/**
 * 用户登陆表
 */
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Login {
	private String userId;
	private String userPassword;
	private int userIdentity;
	private Date userRegitime;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public int getUserIdentity() {
		return userIdentity;
	}

	public void setUserIdentity(int userIdentity) {
		this.userIdentity = userIdentity;
	}

	public Date getUserRegitime() {
		return userRegitime;
	}

	public void setUserRegitime(Date userRegitime) {
		this.userRegitime = userRegitime;
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
		return "Login [userId=" + userId + ", userPassword=" + userPassword
				+ ", userIdentity=" + userIdentity + ", userRegitime="
				+ userRegitime + ", reserveField1=" + reserveField1
				+ ", reserveField2=" + reserveField2 + ", reserveField3="
				+ reserveField3 + "]";
	}

	
	
}
