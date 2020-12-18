package com.finals.fogams.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finals.fogams.model.dto.BookmarkDto;

@Repository
public class Personal_menu_DaoImpl implements Personal_menu_Dao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BookmarkDto> bookMarkList() {
		
		
		return null;
	}

	@Override
	public BookmarkDto bookMarkselectOne() {
		return null;
	}

	@Override
	public int bookMarkInsert(BookmarkDto dto) {
		return 0;
	}

	@Override
	public int bookMarkDelete(int bookmark_no) {
		return 0;
	}

}
