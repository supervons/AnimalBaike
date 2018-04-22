package com.animal.model;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class NoticeInfo{
	private String noticeId;
	private String noticePublisher;
	private String noticeContent;
	private Date releaseTime;
	private String reserveField1;
	private String reserveField2;
	private String reserveField3;
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticePublisher() {
		return noticePublisher;
	}
	public void setNoticePublisher(String noticePublisher) {
		this.noticePublisher = noticePublisher;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
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
		return "NoticeInfo [noticeId=" + noticeId + ", noticePublisher="
				+ noticePublisher + ", noticeContent=" + noticeContent
				+ ", releaseTime=" + releaseTime + ", reserveField1="
				+ reserveField1 + ", reserveField2=" + reserveField2
				+ ", reserveField3=" + reserveField3 + "]";
	}
	
}
