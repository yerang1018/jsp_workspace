package person;

public class PersonDTO {

	private String name;
	private int age;
	
//	public PersonDTO() {}		:   항상 기본 생성자 있어야한다는 것을 잊지말자 (jsp:useBean 을 사용하기 위해서)
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
}
