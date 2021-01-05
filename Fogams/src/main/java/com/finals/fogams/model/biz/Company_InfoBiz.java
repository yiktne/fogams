package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;
import com.finals.fogams.model.dto.Company_PriceDto;

public interface Company_InfoBiz {

public List<CompanyDto> selectList(int company_no);
	
	public int insert(CompanyDto dto);
	
	public int updateMemberGrade(int member_no);
	
	public int delete(int company_no);
	
	public int insertCom_menu(List<Company_PriceDto> list);
}
