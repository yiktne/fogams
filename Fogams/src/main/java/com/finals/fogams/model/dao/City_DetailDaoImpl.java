package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.CompanyDto;

@Repository
public class City_DetailDaoImpl implements City_DetailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CompanyDto> selectlist(String city) {
		
		List<CompanyDto> list = new ArrayList<CompanyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectlist", city);
			System.out.println("dao : " + city);
		} catch (Exception e) {
			System.out.println("[ERROR] selectlist");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public CompanyDto selectOne(int company_no) {
		
		CompanyDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", company_no);
		}catch(Exception e) {
			System.out.println("[ERROR] selectOne");
			e.printStackTrace();
		}
		
		return dto;
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
