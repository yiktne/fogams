package com.finals.fogams.model.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class PlanListDto {

	private int plan_no;
	private int member_no;
	private String plan_title;
	private Date plan_date;

	public PlanListDto() {
	}

	public PlanListDto(int plan_no, int member_no,String plan_title ,Date plan_date) {
		this.plan_no = plan_no;
		this.member_no = member_no;
		this.plan_title = plan_title;
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

	public String getPlan_date() {
		
		SimpleDateFormat stf = new SimpleDateFormat("YYYY-MM-dd");
		String dd = stf.format(plan_date);
		
		return dd;
	}

	public void setPlan_date(Date plan_date) {
		this.plan_date = plan_date;
		
		
		
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	
	

}
