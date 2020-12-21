package com.finals.fogams.common.util;

public class Criteria {

	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private String company_city;

	public Criteria() {
		this.page = 1; //페이지 초기값은 1
		this.perPageNum = 10; //한 페이지당 보여질 갯수 10
	}
	
	public Criteria(String company_city) {
		this.company_city = company_city;
	}

	public void setPage(int page) {
		// 페이지가 0이라면 페이지를 1로 세팅. 아니라면 현재 페이지값으로 세팅.
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		//한 페이지당 보여지는 것이 0이거나 100보다 작은동안
		//현재페이지 넘버는 10으로 세팅.
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	public String getCompany_city() {
		return company_city;
	}

	public void setCompany_city(String company_city) {
		this.company_city = company_city;
	}


}
