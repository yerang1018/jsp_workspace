package ex02;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {

	
	private static FileUtil instance = new FileUtil();
	
	public static FileUtil getInstance() {

		return instance;
		
	}
	private FileUtil() {}
	
	//	request 가 multipartReuest 로 바뀜 
	
	
	//	파일 처리에 관련된 필드
	//	MultipartRequest 를 만들기 위해 필요한 필드 5개 (HttpServlet .. 내장 객체 request 도 필요함)
	private String saveDirectory = null;
	private int maxPostSize = 1024 * 1024 * 20;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	//	request 를 전달받아서, 파일 및 다른 데이터를 DTO 에 담아서 반환하는 함수
	public Ex02DTO getDTO(HttpServletRequest request) throws IOException , ParseException {
		Ex02DTO dto = null;
		
		
		//	1) 저장할 디렉토리가 없으면 새로 생성
		if(saveDirectory == null) {
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("/upload");
			File dir = new File(saveDirectory);
			dir.mkdirs();
		}
		
		
		//	저장경로 확인방법
//		System.out.println(saveDirectory);
		
		
		//	2)	request 를 이용하여 MultipartRequest 객체를 생성
		//	이때, 첨부파일은 saveDirectory 위치에 자동으로 생성된다 (업로드 된다)
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		
		
		
		
		//	3)	일반 문자열 파라미터는 getParameter(String name) 으로 받는다
		String title = mpRequest.getParameter("title");
		
		
		
		//	4)	첨부파일은 getFile(String name)으로 받는다
		//		파일형태로 이미지를 받아옴
		File image = mpRequest.getFile("image");	//	form 내부 내용이랑 일치 시킨다  :  <input type="file" name="image">  

		
		
		
		//	5) java.sql.Date 는 
		//		new java.sql.Date(new java.util.Date().getTime()) 으로 받는다
		
		//	파일 형태를 제외한 모든 파라미터는 초기값이 String 
		//	처음엔 String -> java.util.Date -> long -> java.sql.Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String inputDate = mpRequest.getParameter("eventDate");
		java.util.Date d1 = sdf.parse(inputDate);
		long time = d1.getTime();
		java.sql.Date d2 = new java.sql.Date(time);
		
		
		
		
		//	6) 준비된 값을 모두 dto에 세팅
		dto = new Ex02DTO();
		dto.setTitle(title);
		dto.setImage(image.getName());		//	파일의 이름만 문자열 형식으로 저장 : 나중에 출력 등에 이용하기 위해서 태그에 써먹어야하기 때문 
		dto.setEventDate(d2);
		
		
		return dto;
	}


	//	saveDirectory 내부의 파일이름을 문자열의 배열 형태로 반환하는 함수
	public String[] getFileNames() {
		String[] arr = null;
		if(saveDirectory != null) {
			File dir = new File(saveDirectory);
			arr = dir.list();
		}
		return arr;
	}






}
