package com.animal.model;


/**
 * 动物基本信息表
 */
import org.springframework.stereotype.Component;
@Component
public class AnimalInfo {
	private String animalId;
	private String animalType;
	private String animalName;
	private String animalEnlishName;
	private String animalRegion;
	private String animalFileId;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getAnimalId() {
		return animalId;
	}
	public void setAnimalId(String animalId) {
		this.animalId = animalId;
	}
	public String getAnimalType() {
		return animalType;
	}
	public void setAnimalType(String animalType) {
		this.animalType = animalType;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public String getAnimalEnlishName() {
		return animalEnlishName;
	}
	public void setAnimalEnlishName(String animalEnlishName) {
		this.animalEnlishName = animalEnlishName;
	}
	public String getAnimalRegion() {
		return animalRegion;
	}
	public void setAnimalRegion(String animalRegion) {
		this.animalRegion = animalRegion;
	}
	public String getAnimalFileId() {
		return animalFileId;
	}
	public void setAnimalFileId(String animalFileId) {
		this.animalFileId = animalFileId;
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
		return "AnimalInfo [animalId=" + animalId + ", animalType="
				+ animalType + ", animalName=" + animalName
				+ ", animalEnlishName=" + animalEnlishName + ", animalRegion="
				+ animalRegion + ", animalFileId=" + animalFileId
				+ ", reserveField1=" + reserveField1 + ", reserveField2="
				+ reserveField2 + ", reserveField3=" + reserveField3 + "]";
	}
	
}
