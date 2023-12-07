package ex06;

public class MemberDTO {
	private String name;			//	ex06.jsp 에서 name 과 imgPath 에 대한 함수를 만들었기 때문 
	private String imgPath;
	
	
	public MemberDTO() {}			//	기본생성자는 나중에 useBean 태그를 사용할 수 있기 때문에 항상 만들어두자.
	

	public MemberDTO(String name) {
		this.name = name;
		this.imgPath = "image/" + name + ".png";
	}


	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		this.imgPath = "image/" + name + ".png";
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	
	
}
