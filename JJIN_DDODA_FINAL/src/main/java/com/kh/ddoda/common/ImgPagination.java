package com.kh.ddoda.common;

import com.kh.ddoda.common.PageInfo;

public class ImgPagination {

	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		int pageLimit = 10;//한 페이지에서 보여줄 네비게이
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 8;
		//전체 게시글 갯수 123일 때, 한 페이지 당 8개씩 보여준다면 15 + 3개 
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = (((int)((double)currentPage/pageLimit + 0.9))-1) * pageLimit + 1;
		endPage = startPage + pageLimit -1;
//		System.out.println(startPage+", "+endPage);
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, pageLimit,startPage, endPage, listCount, maxPage);
		return pi;
	}
}
