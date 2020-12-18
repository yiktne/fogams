package com.finals.fogams.model.dto;

public class BookmarkDto {

	private int bookmark_no;
	private int company_no;
	private int member_no;
	private String member_id;

	public BookmarkDto() {
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

	
}
