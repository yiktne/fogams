package com.finals.fogams.model.dto;

import java.util.Date;

public class ReviewDto {

	private int review_no;
	private String review_title;
	private String review_content;
	private int member_no;
	private Date review_date;
	private int plan_no;

	public ReviewDto() {
	}

	public ReviewDto(int review_no, String review_title, String review_content, int member_no, Date review_date,
			int plan_no) {
		this.review_no = review_no;
		this.review_title = review_title;
		this.review_content = review_content;
		this.member_no = member_no;
		this.review_date = review_date;
		this.plan_no = plan_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}

}
