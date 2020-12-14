package com.finals.fogams.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.MemberDao;
import com.finals.fogams.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(int member_id) {
		return dao.login(member_id);
	}
	
	@Override
	public int register(MemberDto dto) {
		return dao.register(dto);
	}
	
	@Override
	public int checkID(String id) {
		return dao.checkID(id);
	}
}
