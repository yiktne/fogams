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

	//북마크 리스트 보기
	@Override
	public List<BookmarkDto> bookMarkList(int member_no) {
		List<BookmarkDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE + "myBookmarkList", member_no);
		} catch (Exception e) {
			System.out.println("[ERROR] myBookmarkList");
			e.printStackTrace();
		}
		
		return list;
	}
	
	//이미 추가된 북마크인지 체크
	@Override
	public int bookmarkValidityCheck(BookmarkDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "bookmarkValidityCheck", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] bookmarkValidityCheck");
			e.printStackTrace();
		}
		
		return res;
	}

	
	//북마크 추가
	@Override
	public int bookMarkInsert(BookmarkDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertBookmark", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] bookMarkInsert");
			e.printStackTrace();
		}
		return res;
	}

	//북마크 삭제
	@Override
	public int bookMarkDelete(int bookmark_no) {
		
		int res = 0; //deleteBookmark
		
		try {
			res = sqlSession.insert(NAMESPACE + "deleteBookmark", bookmark_no);
		} catch (Exception e) {
			System.out.println("[ERROR] deleteBookmark");
			e.printStackTrace();
		}
		
		return res;
	}



}
