package com.finals.fogams.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public MemberDto login(int member_id) {
		
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "login");
		} catch (Exception e) {
			System.out.println("[ERROR] member login error");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int register(MemberDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "register", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] member register");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int checkID(String id) {

		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "checkID", res);
		} catch (Exception e) {
			System.out.println("[ERROR] member checkID");
			e.printStackTrace();
		}
		
		return res;
	}
}
