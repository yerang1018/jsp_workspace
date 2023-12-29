package board;

import java.sql.Date;

public class BoardDTO {

//    idx              number              default board_seq.nextval primary key,
//    title            varchar2(100)        not null,
//    writer           varchar2(500)       not null,
//    content          varchar2(4000)        not null,
//    writeDate        date                 default sysdate,
	
	
	private int idx;
	private String title;
	private String writer;
	private String content;
	private Date writeDate;
	
	
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
}
