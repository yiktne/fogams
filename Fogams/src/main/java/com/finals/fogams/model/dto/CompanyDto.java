package com.finals.fogams.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class CompanyDto {

	private int company_no;
	private String company_name;
	private int member_no;
	private String company_sort;
	private String company_content;
	private String company_tel;
	private String company_number;
	private String company_img;
	private String company_addr;
	private String company_city;
	private MultipartFile uploadfile;
	private String company_product;
	private String company_money;

	public CompanyDto() {
	}

	public CompanyDto(int company_no, String company_name, String company_sort, int member_no,String company_content,
			String company_tel, String company_number, String company_img,
			String company_city, String company_addr, MultipartFile uploadfile) {
		this.company_no = company_no;
		this.company_name = company_name;
		this.member_no = member_no;
		this.company_sort = company_sort;
		this.company_content = company_content;
		this.company_tel = company_tel;
		this.company_number = company_number;
		this.company_img = company_img;
		this.company_addr = company_addr;
		this.company_city = company_city;
		this.uploadfile = uploadfile;
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

	public String getCompany_content() {
		return company_content;
	}

	public void setCompany_content(String company_content) {
		this.company_content = company_content;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
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

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}

	public String getCompany_city() {
		return company_city;
	}

	public void setCompany_city(String company_city) {
		this.company_city = company_city;
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
	
	
	

}
