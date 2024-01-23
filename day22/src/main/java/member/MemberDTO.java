package member;

public class MemberDTO {
	
//    idx         number              default member_seq.nextval primary key,
//    userid      varchar2(100)       unique not null,
//    userpw      varchar2(500)       not null,
//    username    varchar2(100)       not null,
//    email       varchar2(100)       not null,
//    gender      varchar2(50)        check(gender in ('남성' , '여성'))
	
	private int idx;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String gender;
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
