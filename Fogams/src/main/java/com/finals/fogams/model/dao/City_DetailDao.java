package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.Company_InfoDto;
import com.finals.fogams.model.dto.Company_join_Company_infoDto;

public interface City_DetailDao {
	
	String NAMESPACE = "cityDetail.";
	
	public List<Company_join_Company_infoDto> selectlist(String city);
	public Company_InfoDto selectOne(int myno);
	public int insert(Company_InfoDto dto);
	public int update(Company_InfoDto dto);
	public int delete(int myno);

}
