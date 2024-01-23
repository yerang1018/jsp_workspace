package com.itbank.board;

import java.sql.Date;

public class BoardDTO {

//    	idx         number              default board2_seq.nextval primary key,
//    	title       varchar2(500)       not null,
//    	writer      varchar2(100)       not null,
//    	content     varchar2(4000)      not null,
//    	image       varchar2(500),
//    	ipaddr      varchar2(100)       not null,
//   	viewCount   number              default 0,
//   	writeDate   date                default sysdate
	
	
	private int idx;
	private String title;
	private String writer;
	private String content;
	private String image;
	private String ipaddr;
	private int viewCount;
	private Date writeDate;
	private int deleted;
	
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	
	
	
	
}
