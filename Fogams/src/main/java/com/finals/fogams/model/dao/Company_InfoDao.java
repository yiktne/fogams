package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;

public interface Company_InfoDao {
	
	String NAMESPACE = "com.companyinfo.";
	
	public List<CompanyDto> selectList(int company_no);
	
	public int insert(CompanyDto dto);
	
	public int update(CompanyDto dto);
	
	public int delete(int company_no);

}
