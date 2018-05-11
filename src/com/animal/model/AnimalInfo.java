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
	private String animalEnglishName;
	private String animalRegion;
	private String animalFileId;
	private String animalDetails;
	private String animalStatus;
	private String animalUploadUser;
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
	public String getAnimalEnglishName() {
		return animalEnglishName;
	}
	public void setAnimalEnglishName(String animalEnglishName) {
		this.animalEnglishName = animalEnglishName;
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
	public String getAnimalDetails() {
		return animalDetails;
	}
	public void setAnimalDetails(String animalDetails) {
		this.animalDetails = animalDetails;
	}
	public String getAnimalStatus() {
		return animalStatus;
	}
	public void setAnimalStatus(String animalStatus) {
		this.animalStatus = animalStatus;
	}
	public String getAnimalUploadUser() {
		return animalUploadUser;
	}
	public void setAnimalUploadUser(String animalUploadUser) {
		this.animalUploadUser = animalUploadUser;
	}
	@Override
	public String toString() {
		return "AnimalInfo [animalId=" + animalId + ", animalType="
				+ animalType + ", animalName=" + animalName
				+ ", animalEnglishName=" + animalEnglishName + ", animalRegion="
				+ animalRegion + ", animalFileId=" + animalFileId
				+ ", animalDetails=" + animalDetails + ", animalStatus="
				+ animalStatus + ", animalUploadUser=" + animalUploadUser + "]";
	}
	
}
