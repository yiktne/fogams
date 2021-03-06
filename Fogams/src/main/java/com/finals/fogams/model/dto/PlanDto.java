package com.finals.fogams.model.dto;

import java.util.Date;

public class PlanDto {
	
	private int member_no;
	private int plan_no;
	private int company_no;
	private String plan_time;
	private String plan_price;
	private String plan_title;
	public PlanDto() {
	}

	public PlanDto(int plan_no, int company_no, String plan_time, String plan_price) {
		this.plan_no = plan_no;
		this.company_no = company_no;
		this.plan_time = plan_time;
		this.plan_price = plan_price;
	}
	
	

	public PlanDto(int member_no, int plan_no, int company_no, String plan_time, String plan_price, String plan_title) {
		this.member_no = member_no;
		this.plan_no = plan_no;
		this.company_no = company_no;
		this.plan_time = plan_time;
		this.plan_price = plan_price;
		this.plan_title = plan_title;
	}

	public int getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getPlan_time() {
		return plan_time;
	}

	public void setPlan_time(String plan_time) {
		this.plan_time = plan_time;
	}

	public String getPlan_price() {
		return plan_price;
	}

	public void setPlan_price(String plan_price) {
		this.plan_price = plan_price;
	}
	
	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
}
