package com.finals.fogams.model.dao;

import java.util.List;

import com.finals.fogams.model.dto.BookmarkDto;

public interface Personal_menu_Dao {
	
	String NAMESPACE = "personalMenu.";
	public List<BookmarkDto> bookMarkList();
	public BookmarkDto bookMarkselectOne();
	public int bookMarkInsert(BookmarkDto dto);
	public int bookMarkDelete(int bookmark_no);

}
