package com.finals.fogams.model.biz;

import com.finals.fogams.model.dto.MemberDto;

public interface MemberBiz {
	
	public MemberDto login(String member_id);
	
	public int register(MemberDto dto);

	public boolean checkID(String id);
}
