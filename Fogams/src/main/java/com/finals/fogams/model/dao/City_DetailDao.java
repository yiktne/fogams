package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;

public interface City_DetailDao {
	
	String NAMESPACE = "cityDetail.";
	String NAMESPACE2 = "companyDetail.";
	
	public List<CompanyDto> selectlist(String company_city);
	public CompanyDto selectOne(int company_no);
	public int insert(CompanyDto dto);
	public int update(CompanyDto dto);
	public int delete(int company_no);
	public List<Company_PriceDto> showCom_menu(int company_no);
}
