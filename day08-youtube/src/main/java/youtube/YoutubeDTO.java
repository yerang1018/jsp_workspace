package youtube;

public class YoutubeDTO {

//		IDX			NUMBER
//		TITLE		VARCHAR2(100 BYTE)
//		CATEGORY	VARCHAR2(50 BYTE) 	check ('전체','음악')
//		NAME		VARCHAR2(100 BYTE)
//		IMGNAME		VARCHAR2(1000 BYTE)
//		TAG			VARCHAR2(2000 BYTE)
	
	private int idx;
	private String title;
	private String category;
	private String name;
	private String imgname;
	private String tag;
	
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}

	
	
}
