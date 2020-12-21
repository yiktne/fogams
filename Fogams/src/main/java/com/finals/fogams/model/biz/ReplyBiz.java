package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.ReplyDto;

public interface ReplyBiz {

	
	public List<ReplyDto> selectList(int company_no);
	
	public int insert(ReplyDto dto);
	
	public int update(ReplyDto dto);
	
	public int delete(int reply_no);
}
