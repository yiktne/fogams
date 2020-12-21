package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.ReplyDto;

public interface ReplyDao {

	String NAMESPACE = "com.reply.";
	
	public List<ReplyDto> selectList(int company_no);
	
	public int insert(ReplyDto dto);
	
	public int update(ReplyDto dto);
	
	public int delete(int reply_no);
	
}
