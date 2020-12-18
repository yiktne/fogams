package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.model.dto.CompanyDto;

@Repository
public class City_DetailDaoImpl implements City_DetailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CompanyDto> selectlist(Criteria cri) {
		
		List<CompanyDto> list = new ArrayList<CompanyDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectlist", cri);
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
	public CompanyDto selectCity(String company_city) {
		
		CompanyDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectCity", company_city);
		}catch(Exception e) {
			System.out.println("[ERROR] selectCity");
			e.printStackTrace();
		}
		return dto;
	}

	
	
	//페이징을 위한 메소드. 0이상인 company_no들을 지역에 따라 조회해서 총 갯수 구함.
	@Override
	public int listCount(String company_city) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "listCount", company_city);
		}catch(Exception e) {
			System.out.println("[ERROR] listCount");
			e.printStackTrace();
		}
		
		return res;
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
