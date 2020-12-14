package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.Company_InfoDto;

public interface Company_InfoDao {
	
	String NAMESPACE = "com.companyinfo.";
	
	public List<Company_InfoDto> selectList(int company_no);
	
	public int insert(Company_InfoDto dto);
	
	public int update(Company_InfoDto dto);
	
	public int delete(int company_no);

}
