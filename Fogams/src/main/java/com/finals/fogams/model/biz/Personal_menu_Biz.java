package com.finals.fogams.model.biz;

import java.util.List;

import com.finals.fogams.model.dto.BookmarkDto;

public interface Personal_menu_Biz {
	
	public List<BookmarkDto> bookMarkList(int member_no);
	public int bookmarkValidityCheck(BookmarkDto dto);
	public int bookMarkInsert(BookmarkDto dto);
	public int bookMarkDelete(int bookmark_no);

}
