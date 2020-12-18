package com.finals.fogams.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class Company_InfoDto {

	private int company_no;
	private String company_content;
	private String company_tel;
	private String company_number; //사업자번호 
	private String company_addr1;
	private String company_addr2;
	private String company_img;
	private String company_city;
	private MultipartFile uploadfile;

	public Company_InfoDto() {
	}


	public Company_InfoDto(int company_no, String company_content, String company_tel, String company_number,
			String company_addr1, String company_addr2, String company_img,String company_city, MultipartFile uploadfile) {
		this.company_no = company_no;
		this.company_content = company_content;
		this.company_tel = company_tel;
		this.company_number = company_number;
		this.company_addr1 = company_addr1;
		this.company_addr2 = company_addr2;
		this.company_img = company_img;
		this.company_city = company_city;
		this.uploadfile = uploadfile;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
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

	public String getCompany_addr1() {
		return company_addr1;
	}

	public void setCompany_addr1(String company_addr1) {
		this.company_addr1 = company_addr1;
	}

	public String getCompany_addr2() {
		return company_addr2;
	}

	public void setCompany_addr2(String company_addr2) {
		this.company_addr2 = company_addr2;
	}

	public String getCompany_img() {
		return company_img;
	}

	public void setCompany_img(String company_img) {
		this.company_img = company_img;
	}


	public String getCompany_city() {
		return company_city;
	}


	public void setCompany_city(String company_city) {
		this.company_city = company_city;
	}

	public MultipartFile getUploadfile() {
		return uploadfile;
	}

	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}


}
