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
	public List<BookmarkDto> bookMarkList(int member_no) {
		return dao.bookMarkList(member_no);
	}
	
	@Override
	public int bookmarkValidityCheck(BookmarkDto dto) {
		return dao.bookmarkValidityCheck(dto);
	}

	@Override
	public int bookMarkInsert(BookmarkDto dto) {
		return dao.bookMarkInsert(dto);
	}

	@Override
	public int bookMarkDelete(int bookmark_no) {
		return dao.bookMarkDelete(bookmark_no);
	}


}
