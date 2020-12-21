package com.finals.fogams.model.dto;

import java.util.Date;

public class ReplyDto {

	private int reply_no;
	private int member_no;
	private int company_no;
	private int reply_star;
	private String reply_content;
	private Date reply_date;

	public ReplyDto() {
	}

	public ReplyDto(int reply_no, int member_no, int company_no, int reply_star, String reply_content,
			Date reply_date) {
		this.reply_no = reply_no;
		this.member_no = member_no;
		this.company_no = company_no;
		this.reply_star = reply_star;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public int getReply_star() {
		return reply_star;
	}

	public void setReply_star(int reply_star) {
		this.reply_star = reply_star;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

}
