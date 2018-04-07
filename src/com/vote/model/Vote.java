package com.vote.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
public class Vote {
	private String voteId;
	private String voteTitle;
	private String voteExplain;
	private String voteResultA;
	private String voteResultB;
	private String voteResultC;
	private String voteResultD;
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date   voteBeginTime;
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date   voteEndTime;
	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getVoteTitle() {
		return voteTitle;
	}
	public void setVoteTitle(String voteTitle) {
		this.voteTitle = voteTitle;
	}
	public String getVoteExplain() {
		return voteExplain;
	}
	public void setVoteExplain(String voteExplain) {
		this.voteExplain = voteExplain;
	}
	public String getVoteResultA() {
		return voteResultA;
	}
	public void setVoteResultA(String voteResultA) {
		this.voteResultA = voteResultA;
	}
	public String getVoteResultB() {
		return voteResultB;
	}
	public void setVoteResultB(String voteResultB) {
		this.voteResultB = voteResultB;
	}
	public String getVoteResultC() {
		return voteResultC;
	}
	public void setVoteResultC(String voteResultC) {
		this.voteResultC = voteResultC;
	}
	public String getVoteResultD() {
		return voteResultD;
	}
	public void setVoteResultD(String voteResultD) {
		this.voteResultD = voteResultD;
	}
	public Date getVoteBeginTime() {
		return voteBeginTime;
	}
	public void setVoteBeginTime(Date voteBeginTime) {
		this.voteBeginTime = voteBeginTime;
	}
	public Date getVoteEndTime() {
		return voteEndTime;
	}
	public void setVoteEndTime(Date voteEndTime) {
		this.voteEndTime = voteEndTime;
	}
	@Override
	public String toString() {
		return "Userchoice [voteId=" + voteId + ", voteTitle=" + voteTitle
				+ ", voteExplain=" + voteExplain + ", voteResultA="
				+ voteResultA + ", voteResultB=" + voteResultB
				+ ", voteResultC=" + voteResultC + ", voteResultD="
				+ voteResultD + ", voteBeginTime=" + voteBeginTime
				+ ", voteEndTime=" + voteEndTime + "]";
	}
	
}
