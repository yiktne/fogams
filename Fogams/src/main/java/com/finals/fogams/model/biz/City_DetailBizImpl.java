package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.model.dao.City_DetailDao;
import com.finals.fogams.model.dto.CompanyDto;

@Service
public class City_DetailBizImpl implements City_DetailBiz{
	
	@Autowired
	private City_DetailDao dao;

	@Override
	public List<CompanyDto> selectlist(Criteria cri) {
		return dao.selectlist(cri);
	}
	
	@Override
	public int listCount(String company_city) {
		return dao.listCount(company_city);
	}
	
	@Override
	public CompanyDto selectCity(String company_city) {
		return dao.selectCity(company_city);
	}

	@Override
	public CompanyDto selectOne(int company_no) {
		return dao.selectOne(company_no);
	}

	@Override
	public int insert(CompanyDto dto) {
		return 0;
	}

	@Override
	public int update(CompanyDto dto) {
		return 0;
	}

	@Override
	public int delete(int myno) {
		return 0;
	}

}
