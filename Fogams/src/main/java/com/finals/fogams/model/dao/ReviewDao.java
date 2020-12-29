package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.ReviewDto;

public interface ReviewDao {

	String NAMESPACE = "com.review.";
	
	public List<ReviewDto> selectList();
	
	public ReviewDto selectOne(int review_no);
	
	public int insert(ReviewDto dto);
	
	public int update(ReviewDto dto);
	
	public int delete(int review_no);
}
