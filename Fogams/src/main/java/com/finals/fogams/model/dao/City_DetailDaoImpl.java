package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.Company_InfoDto;

@Repository
public class City_DetailDaoImpl implements City_DetailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Company_InfoDto> selectlist() {
		
		List<Company_InfoDto> list = new ArrayList<Company_InfoDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectlist");
		} catch (Exception e) {
			System.out.println("[ERROR] selectlist");
			e.printStackTrace();
		}
		
		return list;
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
