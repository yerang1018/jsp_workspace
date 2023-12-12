package ex04;

public class Test02 {

	//	외부에서 호출할 수 없는 생성자 
	private Test02() {
		System.out.println("Test02 생성자 호출 !!");
		
	}
	
	//	자신과 같은 타입의 객체를 저장할 멤버 필드 
	private static Test02 instance;

	
	public static Test02 getInstance() {
		if(instance == null) {		
			instance = new Test02();	//	내부에서는 생성자 호출 가능 
		}
		return instance;
	}
}
