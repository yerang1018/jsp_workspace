package ex03;

import java.sql.Date;

public class ReviewDTO {
	//	form 태그의 	name 속성을 보고 만들기 !!
	//	form 이 있으면 DTO 만들어된다고 생각하자 
	
/*
 * 		create squence review_seq (
 * 			start with 1
 * 			maxvalue 99999
 * 			increment by 1
 * 			nocycle
 * 			nocache
 * 		);
 * 
 * 
 * 		create table review (
 * 			idx			number				default review_seq.nextval primary key,		(= generated as identity primary key)
 * 			image		varchar2(2000)		not null,
 * 			storeName	varchar2(300)		not null,
 * 			content		varchar2(4000)		not null,
 * 			visitDate	Date				not null
 * 		);
 * 
 * 
 * */	
	
	private int idx;			//	pk 를 만들어줄것임
	private String image;
	private String storeName;
	private String content;
	private Date visitDate;
	
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	
	
	
	
}
