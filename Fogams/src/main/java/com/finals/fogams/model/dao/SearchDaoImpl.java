package com.finals.fogams.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.CompanyDto;

@Repository
public class SearchDaoImpl implements SearchDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CompanyDto> searchList(String searchOption, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		List<CompanyDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE + "searchList", map);
		} catch (Exception e) {
			System.out.println("[ERROR] searchList");
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public int countList(String searchOption, String keyword) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "countList", map);
		} catch (Exception e) {
			System.out.println("[ERROR] countList");
			e.printStackTrace();
		}
		
		return res;
	}

}
