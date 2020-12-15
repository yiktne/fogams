package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.Company_InfoDto;

@Repository
public class Company_InfoDaoImpl implements Company_InfoDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<Company_InfoDto> selectList(int company_no) {
		System.out.println(sqlSession);

		List<Company_InfoDto> list = new ArrayList<Company_InfoDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] Company_info selectList");
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int insert(Company_InfoDto dto) {
		System.out.println(sqlSession);
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] Company_Info Insert");
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int update(Company_InfoDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int delete(int company_no) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", company_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Company_Info delete");
			e.printStackTrace();
		}

		return res;
	}



}
