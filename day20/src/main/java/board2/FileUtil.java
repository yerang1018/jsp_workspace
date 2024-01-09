package board2;

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
	
	public BoardDTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		BoardDTO dto = new BoardDTO();
		
		MultipartRequest mpRequest = new MultipartRequest(request, saveDirectory , maxPostSize, encoding, policy);
		
	
		
		//	파일은 따로 받아오자 (파라미터 사용이 불가능하기 때문이다)
		File uploadFile = mpRequest.getFile("uploadFile");		//	form 에 있는 이름과 동일해야함!(== write.jsp 에 있는 form 확인)
		
		if(uploadFile != null) {	//	파일이 null 이 아닐때만 이름 가져와라 (Nullpointer 오류가 나지 않도록)
			dto.setImage(uploadFile.getName());
		}
		
		
		dto.setTitle(mpRequest.getParameter("title"));		//	다른 애들은 파라미터로 받아오면 됨
		dto.setWriter(mpRequest.getParameter("writer"));	//	header.jsp 에 	FileUitl.getInstance() 해두기!!!!
		dto.setContent(mpRequest.getParameter("content"));
		dto.setIpaddr(mpRequest.getParameter("ipaddr"));
	
		
		return dto;
	}
	
	
}
