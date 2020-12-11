package com.finals.fogams.model.dto;

import java.util.Date;

public class CommentDto {

	private int comment_no;
	private String comment_content;
	private int member_no;
	private int review_no;
	private Date comment_date;

	public CommentDto() {
	}

	public CommentDto(int comment_no, String comment_content, int member_no, int review_no, Date comment_date) {
		this.comment_no = comment_no;
		this.comment_content = comment_content;
		this.member_no = member_no;
		this.review_no = review_no;
		this.comment_date = comment_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

}
