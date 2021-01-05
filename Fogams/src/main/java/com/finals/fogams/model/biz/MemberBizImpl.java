package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.model.dao.MemberDao;
import com.finals.fogams.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(String member_id) {
		return dao.login(member_id);
	}
	
	@Override
	public MemberDto findUser(String id, String name, String email) {
		return dao.findUser(id, name, email);
	}

	@Override
	public String findUserID(String name, String email) {
		return dao.findUserID(name, email);
	}
	
	@Override
	public int register(MemberDto dto) {
		return dao.register(dto);
	}
	
	@Override
	public int updatePassword(String id, String password) {
		return dao.updatePassword(id, password);
	}
	
	@Override
	public boolean checkID(String id) {
		return dao.checkID(id);
	}
	
	@Override
	public boolean checkEmail(String email) {
		return dao.checkEmail(email);
	}

	//관리자 메뉴관리 메뉴들
	@Override
	public List<MemberDto> memberList(Criteria cri) {
		return dao.memberList(cri);
	}

	@Override
	public int listCount() {
		return dao.listCount();
	}
	
	@Override
	public int deleteMember(int member_no) {
		return dao.deleteMember(member_no);
	}


	@Override
	public MemberDto selectOne(int member_no) {
		return dao.selectOne(member_no);
	}
}
