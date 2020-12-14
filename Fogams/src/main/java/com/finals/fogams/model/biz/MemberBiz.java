package com.finals.fogams.model.biz;

import com.finals.fogams.model.dto.MemberDto;

public interface MemberBiz {
	
	public MemberDto login(int member_id);
	
	public int register(MemberDto dto);

	public int checkID(String id);
}
