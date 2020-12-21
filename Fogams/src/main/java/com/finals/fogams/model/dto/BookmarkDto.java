package com.finals.fogams.model.dto;


public class BookmarkDto {

	private int bookmark_no;
	private int company_no;
	private int member_no;
	private String member_id;
	
	private String company_name;
	private String company_sort;
	private String company_tel;
	private String company_img;
	private String company_addr;
	private String company_city;

	public BookmarkDto() {
	}
	
	public BookmarkDto(int company_no) {
		this.company_no = company_no;
	}
	
	public BookmarkDto(int bookmark_no, int company_no, int member_no) {
		this.bookmark_no = bookmark_no;
		this.company_no = company_no;
		this.member_no = member_no;
	}

	public BookmarkDto(int bookmark_no, int company_no, int member_no, String member_id) {
		this.bookmark_no = bookmark_no;
		this.company_no = company_no;
		this.member_no = member_no;
		this.member_id = member_id;
	}


	public BookmarkDto(int bookmark_no, int company_no, int member_no, String company_name,
			String company_sort, String company_tel, String company_img, String company_addr, String company_city) {
		this.bookmark_no = bookmark_no;
		this.company_no = company_no;
		this.member_no = member_no;
		this.company_name = company_name;
		this.company_sort = company_sort;
		this.company_tel = company_tel;
		this.company_img = company_img;
		this.company_addr = company_addr;
		this.company_city = company_city;
	}

	public int getBookmark_no() {
		return bookmark_no;
	}

	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_sort() {
		return company_sort;
	}

	public void setCompany_sort(String company_sort) {
		this.company_sort = company_sort;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_img() {
		return company_img;
	}

	public void setCompany_img(String company_img) {
		this.company_img = company_img;
	}

	public String getCompany_addr() {
		return company_addr;
	}

	public void setCompany_addr(String company_addr) {
		this.company_addr = company_addr;
	}

	public String getCompany_city() {
		return company_city;
	}

	public void setCompany_city(String company_city) {
		this.company_city = company_city;
	}

	
}
