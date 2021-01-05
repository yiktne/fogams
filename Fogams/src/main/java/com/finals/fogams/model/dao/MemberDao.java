package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.common.util.Criteria;
import com.finals.fogams.model.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "com.member.";
	
	public MemberDto login(String member_id);
	
	public MemberDto findUser(String id, String name, String email);

	public String findUserID(String name, String email);
	
	public int register(MemberDto dto);
	
	public int updatePassword(String id, String password);
	
	public boolean checkID(String id);
	
	public boolean checkEmail(String email);
	
	//관리자 멤버관리 메소드들
	public List<MemberDto> memberList(Criteria cri);
	public int listCount();
	public int deleteMember(int member_no);
}





