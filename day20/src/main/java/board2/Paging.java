package board2;

public class Paging {
	
	private int page;			
	private int perPage;		
	private int boardCount;
	private int offset;			//	offset : 건너뛸 페이지 개수
	private int fetch;			//	fetch  : 그 다음 불러올 게시글 개수 (== perPage)
	
	
	private int pageCount;		//	전체 페이지 개수
	private int section;		//	페이지를 10개씩 묶어서 하나의 구역으로 설정하고 0부터 시작
	private boolean prev;		//	이전 구역이 있으면 true
	private boolean next;		//	다음 구역이 있으면 true
	
	private int begin;			//	구역 시작 페이지
	private int end;			//	구역 끝 페이지	(pageCount 보다 크면 안된다 !! == 게시글 개수보다 클 수가 없음) 
	
	
	//	생성자를 대신할 static method
	//	싱글톤으로 객체를 생성하면 모두 같은 페이지만 볼 수 밖에 없음
	//	사용자에 따라서 페이지 번호를 전달받아서 
	//	각기 다르게 처리해주어야하기 때문이다 
	public static Paging newInstance(int page, int boardCount) {
		return new Paging(page, boardCount);
		
	}
	
	
	
	//	생성자 : 페이지와 보드 카운트를 전달 받았을때
	//			나머지 컬럼의 값을 채울 수 있게 
	private Paging(int page, int boardCount) {		//	boardCount 에서 page 내용만 불러오기
		this.page = page;
		this.boardCount = boardCount;
		
		perPage = 15;					//	화면에 출력될 페이지 개수
		offset = (page - 1) * perPage;	
		fetch = perPage;
		
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage != 0) ? 1: 0;
		section = (page - 1) / 10;		//	구역 : 1 ~ 10(== 0) ,  11 ~ 20(== 1) 
		
		begin = section * 10 + 1;
		end = begin + 9;
		
		prev = section != 0;	//	이전은 섹션이 0이 아닐때만 존재 (prev = true)
		next = pageCount > end;
		
		if(end > pageCount) {	//	end는 pageCount 보다 크면 안된다 !! == 게시글 개수보다 클 수가 없음
			end = pageCount;
			next = false;		//	끝 페이지이기 때문에 더 이상 다음 페이지가 없음(false 로 next 를 출력시키지 않음)
		}
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getFetch() {
		return fetch;
	}
	public void setFetch(int fetch) {
		this.fetch = fetch;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}



	public int getBegin() {
		return begin;
	}



	public void setBegin(int begin) {
		this.begin = begin;
	}



	public int getEnd() {
		return end;
	}



	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
}
