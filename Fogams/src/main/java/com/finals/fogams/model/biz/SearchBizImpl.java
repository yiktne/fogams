package com.finals.fogams.model.biz;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.SearchDao;
import com.finals.fogams.model.dto.CompanyDto;

@Service
public class SearchBizImpl implements SearchBiz {
	
	@Autowired
	private SearchDao dao;

	@Override
	public List<CompanyDto> searchList(String searchOption, String keyword) {
		return dao.searchList(searchOption, keyword);
	}

	@Override
	public int countList(String searchOption, String keyword) {
		return dao.countList(searchOption, keyword);
	}

}
