package com.finals.fogams.model.dto;

import java.util.Date;

public class PayDto {

	private int pay_no;
	private int member_no;
	private String pay_content;
	private Date pay_date;
	private int company_no;

	public PayDto() {
	}

	public PayDto(int pay_no, int member_no, String pay_content, Date pay_date, int company_no) {
		this.pay_no = pay_no;
		this.member_no = member_no;
		this.pay_content = pay_content;
		this.pay_date = pay_date;
		this.company_no = company_no;
	}

	public int getPay_no() {
		return pay_no;
	}

	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getPay_content() {
		return pay_content;
	}

	public void setPay_content(String pay_content) {
		this.pay_content = pay_content;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

}
