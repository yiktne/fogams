package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.Company_InfoDto;
import com.finals.fogams.model.dto.Company_join_Company_infoDto;

@Repository
public class City_DetailDaoImpl implements City_DetailDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Company_join_Company_infoDto> selectlist(String city) {
		
		List<Company_join_Company_infoDto> list = new ArrayList<Company_join_Company_infoDto>();
		
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
