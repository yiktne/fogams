package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.CompanyDao;
import com.finals.fogams.model.dao.CompanyDaoImpl;
import com.finals.fogams.model.dto.CompanyDto;

@Service
public class CompanyBizImpl implements CompanyBiz {

	@Autowired
	private CompanyDao dao = new CompanyDaoImpl();
	
	@Override
	public List<CompanyDto> selectList() {
		return dao.selectList();
	}

	@Override
	public CompanyDto selectOne(int company_no) {
		return dao.selectOne(company_no);
	}

	@Override
	public int insert(CompanyDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(CompanyDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int company_no) {
		return dao.delete(company_no);
	}

}
