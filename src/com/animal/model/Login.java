package com.animal.model;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class Login {
	private String userId;
	private String userPassword;
	private int userIdentity;
	private Date userRegitime;
	
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

	@Override
	public String toString() {
		return "Login [userId=" + userId + ", userPassword=" + userPassword
				+ ", userIdentity=" + userIdentity + ", userRegitime="
				+ userRegitime + "]";
	}
	
	
}
