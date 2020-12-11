package com.finals.fogams.model.dto;

public class ChatListDto {

	private int chat_no;
	private int company_no;
	private int member_no;

	public ChatListDto() {
	}

	public ChatListDto(int chat_no, int company_no, int member_no) {
		this.chat_no = chat_no;
		this.company_no = company_no;
		this.member_no = member_no;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

}
