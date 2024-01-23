package com.itbank.board;

import java.sql.Date;

public class ReplyDTO {

//	  idx         	number          generated as identity primary key,
//    board_idx   	number          references board2(idx),
//    writer      	varchar2(300)   references member(userid)
//                                on delete set null,
//    content     	varchar2(2000)  not null,
//    writeDate  	Date            default sysdate,
//    deleted     	number          check(deleted between 0 and 1),
//    
//    parent_idx  	number          default 0,  --  참조하는 댓글 번호
//    reply_depth 	number          default 0   --  대댓글의 깊이
	
	
	private int idx;
	private int board_idx;
	private String writer;
	private String content;
	private Date writeDate;
	private int deleted;
	private int parent_idx;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(int parent_idx) {
		this.parent_idx = parent_idx;
	}
	public int getReply_depth() {
		return reply_depth;
	}
	public void setReply_depth(int reply_depth) {
		this.reply_depth = reply_depth;
	}
	private int reply_depth;
	
	
	
}
