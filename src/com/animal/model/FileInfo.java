package com.animal.model;
/**
 * 文件信息表
 */
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class FileInfo{
	private String fileId;
	private String fileType;
	private String fileFullPath;
	private String fileName;
	private int fileSize;
	private Date uploadTime;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileFullPath() {
		return fileFullPath;
	}
	public void setFileFullPath(String fileFullPath) {
		this.fileFullPath = fileFullPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
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
		return "FileInfo [fileId=" + fileId + ", fileType=" + fileType
				+ ", fileFullPath=" + fileFullPath + ", fileName=" + fileName
				+ ", fileSize=" + fileSize + ", uploadTime=" + uploadTime
				+ ", reserveField1=" + reserveField1 + ", reserveField2="
				+ reserveField2 + ", reserveField3=" + reserveField3 + "]";
	}

	
}
