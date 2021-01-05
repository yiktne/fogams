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
	public MemberDto login(String member_id) {
		
		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "login", member_id);
		} catch (Exception e) {
			System.out.println("[ERROR] member login error");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public MemberDto findUser(String id, String name, String email) {
		MemberDto dto = null;
		
		try {
			MemberDto findData = new MemberDto();
			findData.setMember_id(id);
			findData.setMember_name(name);
			findData.setMember_email(email);
			dto = sqlSession.selectOne(NAMESPACE + "findUser", findData);
		} catch (Exception e) {
			System.out.println("[ERROR] member findUser");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public String findUserID(String name, String email) {
		String id = null;
		
		try {
			MemberDto findData = new MemberDto();
			findData.setMember_name(name);
			findData.setMember_email(email);
			id = sqlSession.selectOne(NAMESPACE + "findUserID", findData);
		} catch (Exception e) {
			System.out.println("[ERROR] member findUserID");
			e.printStackTrace();
		}
		
		return id;
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
	public int updatePassword(String id, String password) {
		int res = 0;
		
		try {
			MemberDto dto = new MemberDto();
			dto.setMember_id(id);
			dto.setMember_pw(password);
			res = sqlSession.update(NAMESPACE + "updatePassword", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] member updatePassword");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public boolean checkID(String id) {

		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "checkID", id);
		} catch (Exception e) {
			System.out.println("[ERROR] member checkID");
			e.printStackTrace();
		}
		
		return res == 0;
	}
	
	@Override
	public boolean checkEmail(String email) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "checkEmail", email);
		} catch (Exception e) {
			System.out.println("[ERROR] member checkEmail");
			e.printStackTrace();
		}
		
		return res == 0;
	}

	@Override
	public MemberDto selectOne(int member_no) {

		MemberDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] MemberDao selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}
}
