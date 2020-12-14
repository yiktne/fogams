package com.finals.fogams.model.dao;

import com.finals.fogams.model.dto.MemberDto;

public interface MemberDao {

	String NAMESPACE = "com.member.";
	
	public MemberDto login(String member_id);
	
	public int register(MemberDto dto);
	
	public boolean checkID(String id);
}
