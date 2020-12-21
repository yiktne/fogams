package com.finals.fogams.model.biz;

import com.finals.fogams.model.dto.MemberDto;

public interface MemberBiz {

	public MemberDto login(String member_id);
	
	public MemberDto findUser(String id, String name, String email);

	public String findUserID(String name, String email);
	
	public int register(MemberDto dto);
	
	public int updatePassword(String id, String password);
	
	public boolean checkID(String id);
	
	public boolean checkEmail(String email);
}
