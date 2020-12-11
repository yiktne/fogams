package com.finals.fogams.model.dto;

import java.util.Date;

public class PlanListDto {

	private int plan_no;
	private int member_no;
	private Date plan_date;

	public PlanListDto() {
	}

	public PlanListDto(int plan_no, int member_no, Date plan_date) {
		this.plan_no = plan_no;
		this.member_no = member_no;
		this.plan_date = plan_date;
	}

	public int getPlan_no() {
		return plan_no;
	}

	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public Date getPlan_date() {
		return plan_date;
	}

	public void setPlan_date(Date plan_date) {
		this.plan_date = plan_date;
	}

}
