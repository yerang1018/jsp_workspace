package ex03;

import java.util.Random;	//	지시자(jsp)

public class UpdownGame {	//	DAO와 같은 역할 (Model)
							//	실제적인 데이터 처리 
							//	Model과 Handler 는 직접 연결해서 쓰이지 않음
							//	Main 을 이용하여 연결 
	
	//	선언부(jsp)
	private Random ran = new Random();	
	private int cpu = ran.nextInt(100) + 1;
	private int count = 0;

	
	//	 (이 프로그램의 기능_1 : 필수적임)
	//	파라미터를 문자열로 전달받고
	//	결과 메시지를 반환해주는 함수
	public String handle(String param) {	
											
		int user = Integer.parseInt(param);
		String msg = "";
		count++;
		
		if(user == cpu) {
			msg = String.format("정답입니다.   정답 : %d  ,  도전횟수 : %d", cpu , count);
		}
		else if (user < cpu) {
			msg = "UP (" + count + "회 도전중)";
		}
		else {
			msg = "DOWN (" + count + "회 도전중)";
		}
		return msg;
	}
	
	
	//	(이 프로그램의 기능_2 : 선택적임)
	//	시도횟수를 0으로 초기화하고, 랜덤값을 새로 준비하는 함수
	public void reset() {		
		
		count = 0;
		cpu = ran.nextInt(100) + 1;
	}
	
}
