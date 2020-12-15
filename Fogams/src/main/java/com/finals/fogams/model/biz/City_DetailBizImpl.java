package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.City_DetailDao;
import com.finals.fogams.model.dto.Company_InfoDto;
import com.finals.fogams.model.dto.Company_join_Company_infoDto;

@Service
public class City_DetailBizImpl implements City_DetailBiz{
	
	@Autowired
	private City_DetailDao dao;

	@Override
	public List<Company_join_Company_infoDto> selectlist(String city) {
		return dao.selectlist(city);
	}

	@Override
	public Company_InfoDto selectOne(String img) {
		return null;
	}

	@Override
	public int insert(Company_join_Company_infoDto dto) {
		return 0;
	}

	@Override
	public int update(Company_join_Company_infoDto dto) {
		return 0;
	}

	@Override
	public int delete(int myno) {
		return 0;
	}

}
