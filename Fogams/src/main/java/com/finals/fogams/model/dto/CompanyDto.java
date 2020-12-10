package com.finals.fogams.model.dto;

public class CompanyDto {

	private int company_no;
	private String company_name;
	private int member_no;
	private String company_sort;

	public CompanyDto() {
	}

	public CompanyDto(int company_no, String company_name, int member_no, String company_sort) {
		this.company_no = company_no;
		this.company_name = company_name;
		this.member_no = member_no;
		this.company_sort = company_sort;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getCompany_sort() {
		return company_sort;
	}

	public void setCompany_sort(String company_sort) {
		this.company_sort = company_sort;
	}

}
