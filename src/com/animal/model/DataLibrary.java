package com.animal.model;
/**
 * 数据字典表
 */
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class DataLibrary{
	private String dataId;
	private String dataNo;
	private String dataContent;
	private String reMark;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getDataNo() {
		return dataNo;
	}
	public void setDataNo(String dataNo) {
		this.dataNo = dataNo;
	}
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	public String getReMark() {
		return reMark;
	}
	public void setReMark(String reMark) {
		this.reMark = reMark;
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
		return "DataLibrary [dataId=" + dataId + ", dataNo=" + dataNo
				+ ", dataContent=" + dataContent + ", reMark=" + reMark
				+ ", reserveField1=" + reserveField1 + ", reserveField2="
				+ reserveField2 + ", reserveField3=" + reserveField3 + "]";
	}
}
