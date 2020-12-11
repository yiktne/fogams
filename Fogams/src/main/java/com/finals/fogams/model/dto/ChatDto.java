package com.finals.fogams.model.dto;

import java.util.Date;

public class ChatDto {

	private int chat_no;
	private String chat_content;
	private int member_no;
	private Date chat_date;

	public ChatDto() {
	}

	public ChatDto(int chat_no, String chat_content, int member_no, Date chat_date) {
		this.chat_no = chat_no;
		this.chat_content = chat_content;
		this.member_no = member_no;
		this.chat_date = chat_date;
	}

	public int getChat_no() {
		return chat_no;
	}

	public void setChat_no(int chat_no) {
		this.chat_no = chat_no;
	}

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getChat_date() {
		return chat_date;
	}

	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}

}
