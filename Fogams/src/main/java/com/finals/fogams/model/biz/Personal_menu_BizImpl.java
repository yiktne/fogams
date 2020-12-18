package com.finals.fogams.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finals.fogams.model.dao.Personal_menu_Dao;
import com.finals.fogams.model.dto.BookmarkDto;

@Service
public class Personal_menu_BizImpl implements Personal_menu_Biz {
	
	@Autowired
	private Personal_menu_Dao dao;

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
