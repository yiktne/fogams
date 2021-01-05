package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.CompanyDto;

public interface SearchDao {

	String NAMESPACE = "search.";
	
	public List<CompanyDto> searchList(String searchOption, String keyword);
	public int countList(String searchOption, String keyword);
	


}
