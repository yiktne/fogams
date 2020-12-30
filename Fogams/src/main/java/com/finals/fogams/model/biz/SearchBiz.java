package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;

public interface SearchBiz {
	
	public List<CompanyDto> searchList(String searchOption, String keyword);
	public int countList(String searchOption, String keyword);

}
