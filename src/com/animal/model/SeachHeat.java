package com.animal.model;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class SeachHeat{
	private String seachId;
	private String animalId;
	private int seachCount;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getSeachId() {
		return seachId;
	}
	public void setSeachId(String seachId) {
		this.seachId = seachId;
	}
	public String getAnimalId() {
		return animalId;
	}
	public void setAnimalId(String animalId) {
		this.animalId = animalId;
	}
	public int getSeachCount() {
		return seachCount;
	}
	public void setSeachCount(int seachCount) {
		this.seachCount = seachCount;
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
		return "SeachHeat [seachId=" + seachId + ", animalId=" + animalId
				+ ", seachCount=" + seachCount + ", reserveField1="
				+ reserveField1 + ", reserveField2=" + reserveField2
				+ ", reserveField3=" + reserveField3 + "]";
	}
	
}
