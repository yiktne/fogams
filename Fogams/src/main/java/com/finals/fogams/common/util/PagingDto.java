package com.finals.fogams.common.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PagingDto {
	
	private int totalCount; 	// 전체 게시물 수
	private int startPage;		// 현재 페이지 기준 시작 페이지 번호
	private int endPage;		// 현재 페이지 기준 끝 페이지 번호
	private boolean prev; 		// 이전 버튼 활성화 여부
	private boolean next; 		// 다음 버튼 활성화 여부
	private int displayPageNum = 10; // 화면에 보여질 페이지 번호 수
	private Criteria cri;		//page(현재페이지), perPageNum(페이지 당 보여질 게시물의 수)
	
	public void setCri(Criteria cri) {
		this.cri = cri;
		//여기서 사용할 page, perPageNum값을 초기화
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//전체 게시물 갯수를 가져오고 
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	 
	private void calcData() {
		// 현재페이지 / 10 * 10 = endPage 만약 현재페이지가 2라면, 2/10*10 = 2
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		System.out.println("endPage : " + endPage);
		// 시작페이지 = 끝페이지 - 10 + 1; 끝페이지가 14라면 14 - 10 + 1 = 5
		startPage = (endPage - displayPageNum) + 1;
		
		//전체 게시글 수 / 한 페이지당 보여줄 게시글 수 = tempEndPage
		//ex) 130 / 10 = 13 이 전체글을 페이징 한 수가 endPage보다 작다면 endPage에 이 숫자를 대입.
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		//끝페이지 * 10 >= 전체 게시글 수, 즉 전체 페이징 넘버와 각 페이지당 게시글 수를 곱한 수가
		// 전체 게시글 수보다 크거나 같다면 next버튼 활성화.
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		//jsp페이지에서 페이징버튼(1이나 2 등 숫자)를 받음. 그러면 그게 현재페이지.
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("page", page) //현재페이지
							.queryParam("perPageNum", cri.getPerPageNum()) //페이징으로 표시된 숫자
							.build();
		return uriComponents.toUriString();
		// UriComponents : URI를 동적으로 생성해주는 클래스. 파라미터가 조합된 URI를 손쉽게 만듦.
		//ex) ?page=1&perPageNum=10
	}

}
