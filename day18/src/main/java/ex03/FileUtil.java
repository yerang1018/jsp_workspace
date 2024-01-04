package ex03;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {

	private static FileUtil instance = new FileUtil();
	public static FileUtil getInstance() {
		return instance;
	}
	
	private FileUtil() {	//	생성자에 File 생성하는 코드를 넣어서 실행시 바로 폴더를 만들도록 
		File dir = new File(saveDirectory);
		dir.mkdirs();
	}
	
	private String saveDirectory = "C:\\upload";	//	저장 폴더 위치를 아예 지정시켜서, 서버 재시작해도 이미지가 날아가지 않게 한다
													//	대신 context.xml 에 Resources 태그 내용을 넣어주어야
													//	출력까지 가능함 
	private final int maxPostSize = 1024 * 1024 * 50;
	private final String encoding = "UTF-8";
	private final FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	public ReviewDTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		ReviewDTO dto = null;
//		if(saveDirectory == null) {
//			ServletContext application = request.getServletContext();
//			saveDirectory = application.getRealPath("/reviewImage");
		
//		}
		
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory , maxPostSize, encoding, policy);
		
		dto = new ReviewDTO();
		dto.setContent(mpRequest.getParameter("content"));
		dto.setImage(mpRequest.getFile("image").getName());
		dto.setStoreName(mpRequest.getParameter("storeName"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long time = sdf.parse(mpRequest.getParameter("visitDate")).getTime();
		dto.setVisitDate(new java.sql.Date(time));
		
		return dto;
	}
	
	
}
