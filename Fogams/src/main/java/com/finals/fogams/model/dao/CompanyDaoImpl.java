package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.CompanyDto;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<CompanyDto> selectList() {

		List<CompanyDto> list = new ArrayList<CompanyDto>();
		
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] Company selectList");
			e.printStackTrace();
		} 
		
		
		return list;
	}

	@Override
	public CompanyDto selectOne(int company_no) {

		CompanyDto dto = new CompanyDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne");
		} catch (Exception e) {
			System.out.println("[ERROR] Company selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(CompanyDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] Company insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(CompanyDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] Company update");
			e.printStackTrace();
		}
		
		
		
		return res;
	}

	@Override
	public int delete(int company_no) {

		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete", company_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Company delete");
			e.printStackTrace();
		}
		
		
		return res;
	}

}
