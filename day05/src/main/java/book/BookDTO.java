package book;

public class BookDTO {

	private int idx;
	private String title;
	private String author;
	private String publisher;
	private String publishDate;
	
	private static int seq;
	
	public BookDTO() {		//	기본 생성자
		
		this.idx = ++seq;	//	객체를 생성할때마다, seq가 1씩 증가하면서 idx에 대입
		
	}
	
	
	//	마지막으로 추가된 객체의 idx 가 몇번인지 확인하는 기능이 필요하다 !! delete 를 위해서
	//	DAO 에서 사용할 seq 인데 
	//	DTO 에 함수를 만들어주는 이유는
	//	DTO 에 seq 가 만들어져 있기 때문이다 
	public static int getSeq() {
		return seq;
	}
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	
}
