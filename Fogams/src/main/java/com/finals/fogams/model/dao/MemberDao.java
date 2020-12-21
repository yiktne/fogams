package com.finals.fogams.model.dao;

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
}
