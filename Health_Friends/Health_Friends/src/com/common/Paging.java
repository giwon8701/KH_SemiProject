package com.common;

public class Paging {
	private int pageSize;		// 게시 글 수
	private int firstPageNo;	// 첫 번째 페이지 (1페이지)
	private int prevPageNo;		// 이전 페이지
	private int startPageNo;	// 시작 페이지 (페이징 된 것 기준)
	private int pageNo;			// 현재 페이지
	private int endPageNo;		// 끝 페이지 (페이징 된 것 기준)
	private int nextPageNo;		// 다음 페이지
	private int finalPageNo;	// 마지막 페이지 (진짜 마지막 페이지)
	private int totalCount;		// 게시 글 전체 수

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.doPaging();
	}

	private void doPaging() {
		if (this.totalCount == 0)
			return; // 게시 글 전체 수가 없는 경우

		if (this.pageSize == 0)
			// 기본 값 설정 페이지 번호가 0번이면 10페이지까지 나오고 번호가 10이면 11페이지부터 나옴
			this.setPageSize(10); 	

		int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지

		
		// 이미 finalpage에 있는데 이 함수를 호출할 경우 재세팅을 위한 계산식
		if (this.pageNo > finalPage) { 
			// 기본 값 설정
			this.setPageNo(finalPage); 
		}

		if (this.pageNo < 0 || this.pageNo > finalPage) {
			// 현재 페이지 유효성 체크
			this.pageNo = 1;
		}

		int startPage = ((pageNo - 1) / 10) * 10 + 1; // 시작 페이지 (페이징 네 비 기준)
		int endPage = startPage + 10 - 1; // 끝 페이지 (페이징 된 것 기준)

		if (endPage > finalPage) { // [마지막 페이지 (페이징 된 것 기준) > 마지막 페이지] 보다 큰 경우
			endPage = finalPage;
		}

		this.setFirstPageNo(1); // 첫 번째 페이지 번호

		this.setPrevPageNo(pageNo == 1 ? 1 : (pageNo - 1) < 1 ? 1 : (pageNo - 1));

		this.setStartPageNo(startPage); // 시작 페이지 (페이징 된 것 기준)
		this.setEndPageNo(endPage); // 끝 페이지 (페이징 된 것 기준)

		this.setNextPageNo(pageNo == finalPage ? finalPage : (pageNo + 1) > finalPage ? finalPage : (pageNo + 1));
		this.setFinalPageNo(finalPage); // 마지막 페이지 번호

	}

}