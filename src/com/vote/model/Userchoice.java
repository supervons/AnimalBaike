package com.vote.model;

import org.springframework.stereotype.Component;

@Component
public class Userchoice {
	private String voteId;
	private String userId;
	private String userChoice;
	private Vote vote;
	
	public Vote getVote() {
		return vote;
	}
	public void setVote(Vote vote) {
		this.vote = vote;
	}
	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserChoice() {
		return userChoice;
	}
	public void setUserChoice(String userChoice) {
		this.userChoice = userChoice;
	}
	@Override
	public String toString() {
		return "Userchoice [voteId=" + voteId + ", userId=" + userId
				+ ", userChoice=" + userChoice + ", vote=" + vote + "]";
	}

	
}
