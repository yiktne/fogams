package com.finals.fogams.model.dto;

import java.util.Date;

public class PlanDto {

	private int plan_no;
	private int company_no;
	private Date plan_time;
	private String plan_price;

	public PlanDto() {
	}

	public PlanDto(int plan_no, int company_no, Date plan_time, String plan_price) {
		this.plan_no = plan_no;
		this.company_no = company_no;
		this.plan_time = plan_time;
		this.plan_price = plan_price;
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

	public Date getPlan_time() {
		return plan_time;
	}

	public void setPlan_time(Date plan_time) {
		this.plan_time = plan_time;
	}

	public String getPlan_price() {
		return plan_price;
	}

	public void setPlan_price(String plan_price) {
		this.plan_price = plan_price;
	}

}
