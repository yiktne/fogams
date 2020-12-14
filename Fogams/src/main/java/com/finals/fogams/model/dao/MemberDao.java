package com.finals.fogams.model.dao;

import com.finals.fogams.model.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "com.member.";
	
	public MemberDto login(int member_id);
	
	public int register(MemberDto dto);
	
	public int checkID(String id);
}
