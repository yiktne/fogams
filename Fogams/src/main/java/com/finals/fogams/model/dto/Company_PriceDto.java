package com.finals.fogams.model.dto;

import java.util.List;

public class Company_PriceDto {
	private int price_no;
	private int company_no;
	private String company_product;
	private String company_money;
//	private List<String> company_no;
//	private List<String> company_product;
//	private List<String> company_money;

	public Company_PriceDto() {
	}
	
	public Company_PriceDto(int company_no, String company_product, String company_money) {
		this.company_no = company_no;
		this.company_product = company_product;
		this.company_money = company_money;
	}


	public Company_PriceDto(int price_no, int company_no, String company_product, String company_money) {
		this.price_no = price_no;
		this.company_no = company_no;
		this.company_product = company_product;
		this.company_money = company_money;
	}



	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getCompany_product() {
		return company_product;
	}

	public void setCompany_product(String company_product) {
		this.company_product = company_product;
	}

	public String getCompany_money() {
		return company_money;
	}

	public void setCompany_money(String company_money) {
		this.company_money = company_money;
	}

	public int getPrice_no() {
		return price_no;
	}

	public void setPrice_no(int price_no) {
		this.price_no = price_no;
	}
	

}
