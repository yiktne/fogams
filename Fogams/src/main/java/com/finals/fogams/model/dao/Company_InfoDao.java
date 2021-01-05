package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;

public interface Company_InfoDao {
	
	String NAMESPACE = "com.companyinfo.";
	
	public List<CompanyDto> selectList(int company_no);
	
	public int insert(CompanyDto dto);
	
	public int updateMemberGrade(int member_no);
	
	public int delete(int company_no);
	
	public List<CompanyDto> myList(int member_no);
	public List<CompanyDto> selectaddr();

}
