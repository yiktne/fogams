package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.ReplyDao;
import com.finals.fogams.model.dao.ReplyDaoImpl;
import com.finals.fogams.model.dto.ReplyDto;

@Service
public class ReplyBizImpl implements ReplyBiz {

	@Autowired
	private ReplyDao dao = new ReplyDaoImpl();
	
	@Override
	public List<ReplyDto> selectList(int company_no) {
		return dao.selectList(company_no);
	}

	@Override
	public int insert(ReplyDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReplyDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int reply_no) {
		return dao.delete(reply_no);
	}

}
