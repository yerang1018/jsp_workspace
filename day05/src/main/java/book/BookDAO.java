package book;

import java.util.ArrayList;
import java.util.List;

public class BookDAO {

	
	
	
//		서로 다른 JSP 페이지에서 동일한 DAO 객체를 참조하기 위해서
//		싱글톤 패턴 적용
//	
//		1) DAO 객체는 생성자로 호출할 수 없다
//		2) DAO 클래스의 static 메서드를 호출하여 단 하나의 객체만 반환하도록 한다
//	
//	private BookDAO() {}		//	생성자는 외부에서 호출 할 수 없음
//								//	new BookDAO() 불가능 !!  
//								//	즉, BookDAO의 객체를 만들 수 없다
//	
//	private static BookDAO instance = new BookDAO();	//	내부에서 객체를 하나 생성해둔다
//	
//	public static BookDAO getInstance() {	//	객체없이 호출해야하니까, static
//		return instance;	
//	}
	
	
	//	프로그램에서 사용되는 데이터의 저장소
	private ArrayList<BookDTO> list = new ArrayList<>();
	
	
	
	//	 프로그램의 주요 기능은 메서드로 작성
	
	//	목록
	public List<BookDTO> selectList() {
		//	select * from book order by idx;
		
		return list;
	}
	
	//	단일 데이터 조회
	public BookDTO selectOne(int idx) {
//		select * from book where idx = ?;
		
		for(BookDTO dto : list) {			//	향상된 for문
			if(dto.getIdx() == idx) {
				return dto;
			}
		}
		return null;
	}
	
	
	//	추가
	public int insert(BookDTO dto) {
//		insert into book (title, author, publisher, publishDate) values (?, ?, ?, ?);
		
		int row = list.add(dto) ? 1 : 0;
		return row;
	}
	
	//	삭제
	public int delete(int idx) {
//		delete book where idx = ?;
		
		int row = list.removeIf(dto -> dto.getIdx() == idx) ? 1 : 0;	//	람다식
		//	리스트의 각각을 dto 라고 할때 
		//	삭제할 데이터의 idx 와 
		//	리스트 내부 dto의 idx 가 같으면 삭제하라 
		return row;
	}
	
	
	//	마지막으로 추가된 객체의 idx 가 몇번인지 확인하는 기능이 필요하다 !! delete 를 위해서
	//	이름은 동명이인도 있기 때문에
	//	고유식별자를 idx 로 쓰자
	public int currval() {
//		select book_seq.currval from dual;
		
		return BookDTO.getSeq();	
		
	}
	
	
	
}
