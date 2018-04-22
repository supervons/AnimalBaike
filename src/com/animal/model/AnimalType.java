package com.animal.model;
/**
 * 动物分类表
 */
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class AnimalType{
	private String typeId;
	private String topCateGory;
	private String twoCateGory;
	private String threeCateGory;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTopCateGory() {
		return topCateGory;
	}
	public void setTopCateGory(String topCateGory) {
		this.topCateGory = topCateGory;
	}
	public String getTwoCateGory() {
		return twoCateGory;
	}
	public void setTwoCateGory(String twoCateGory) {
		this.twoCateGory = twoCateGory;
	}
	public String getThreeCateGory() {
		return threeCateGory;
	}
	public void setThreeCateGory(String threeCateGory) {
		this.threeCateGory = threeCateGory;
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
		return "AnimalType [typeId=" + typeId + ", topCateGory=" + topCateGory
				+ ", twoCateGory=" + twoCateGory + ", threeCateGory="
				+ threeCateGory + ", reserveField1=" + reserveField1
				+ ", reserveField2=" + reserveField2 + ", reserveField3="
				+ reserveField3 + "]";
	}
	
}
