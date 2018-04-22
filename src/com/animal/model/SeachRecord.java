package com.animal.model;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class SeachRecord{
	private String recordId;
	private String userId;
	private String seachContent;
	private Date seachTime;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getRecordId() {
		return recordId;
	}
	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSeachContent() {
		return seachContent;
	}
	public void setSeachContent(String seachContent) {
		this.seachContent = seachContent;
	}
	public Date getSeachTime() {
		return seachTime;
	}
	public void setSeachTime(Date seachTime) {
		this.seachTime = seachTime;
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
		return "SeachRecord [recordId=" + recordId + ", userId=" + userId
				+ ", seachContent=" + seachContent + ", seachTime=" + seachTime
				+ ", reserveField1=" + reserveField1 + ", reserveField2="
				+ reserveField2 + ", reserveField3=" + reserveField3 + "]";
	}
}
