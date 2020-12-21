package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReplyDto> selectList(int company_no) {

		List<ReplyDto> list = new ArrayList<ReplyDto>();

		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", company_no);
		} catch (Exception e) {
			System.out.println("[ERROR] Reply selectList dao");
			e.printStackTrace();
		}
		

		return list;
	}

	@Override
	public int insert(ReplyDto dto) {

		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insert");
		} catch (Exception e) {
			System.out.println("[ERROR] Reply insert dao");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(ReplyDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update");
		} catch (Exception e) {
			System.out.println("[ERROR] Reply update dao");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int reply_no) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete");
		} catch (Exception e) {
			System.out.println("[ERROR] Reply delete dao");
			e.printStackTrace();
		}

		return res;
	}

}
