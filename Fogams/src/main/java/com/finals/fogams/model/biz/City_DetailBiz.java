package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;

public interface City_DetailBiz {
	
	String NAMESPACE = "cityDetail.";
	
	public List<CompanyDto> selectlist(String city);
	public CompanyDto selectOne(int company_no);
	public int insert(CompanyDto dto);
	public int update(CompanyDto dto);
	public int delete(int myno);

}
