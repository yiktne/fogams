package com.finals.fogams.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ReviewDto> selectList() {
		
		List<ReviewDto> list = new ArrayList<ReviewDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[ERROR] ReviewDao selectList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public ReviewDto selectOne(int review_no) {

		ReviewDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", review_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ReviewDao selectOne");
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public int insert(ReviewDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ReviewDao insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ReviewDto dto) {

		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] ReviewDao update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int review_no) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "delete" , review_no);
		} catch (Exception e) {
			System.out.println("[ERROR] ReviewDao delete");
			e.printStackTrace();
		}
		
		return res;
	}

}
