package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.City_DetailDao;
import com.finals.fogams.model.dto.Company_InfoDto;

@Service
public class City_DetailBizImpl implements City_DetailBiz{
	
	@Autowired
	private City_DetailDao dao;

	@Override
	public List<Company_InfoDto> selectlist() {
		return dao.selectlist();
	}

	@Override
	public Company_InfoDto selectOne(int myno) {
		return null;
	}

	@Override
	public int insert(Company_InfoDto dto) {
		return 0;
	}

	@Override
	public int update(Company_InfoDto dto) {
		return 0;
	}

	@Override
	public int delete(int myno) {
		return 0;
	}

}
