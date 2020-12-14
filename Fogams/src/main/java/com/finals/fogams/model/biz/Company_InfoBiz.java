package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.Company_InfoDto;

public interface Company_InfoBiz {

public List<Company_InfoDto> selectList(int company_no);
	
	public int insert(Company_InfoDto dto);
	
	public int update(Company_InfoDto dto);
	
	public int delete(int company_no);
}
