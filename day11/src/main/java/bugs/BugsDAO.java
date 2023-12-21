package bugs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BugsDAO {
	
	//	싱글톤 (DAO 객체가 여러개일 필요가 없다)
	
	//	외부에서 DAO 객체를 함부로 생성할 수 없도록 
	//	생성자의 접근제한자를 private로 수정 
	//	즉, 내부에서만 생성가능 
	private static BugsDAO instance = new BugsDAO();
	public static BugsDAO getInstance() {
		return instance;
	}
	
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	private Context init;			//	context.xml 에서 작성한 내용대로 객체를 포함하는 컨테이너
									//	내용들을 전부 불러오는 init 
	
	
	private DataSource ds;			//	여러 커넥션을 관리하는 DataSource 객체 
	//	커넥션풀 : 요청이 들어올때마다 새로운 커넥션을 생성하지 말고
	//			 미리 여러개의 커넥션을 생성해주고, 사용한다.
	
	
	
	public BugsDAO() {		//	기본 생성자
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle"); //	코드 내에 오류가 있다면 
																		//	catch 로 넘어가서 메시지 띄어줌
		} catch (NamingException e) {
			System.out.println("지정한 이름의 객체를 찾을 수 없습니다 : " + e);
			
		} finally {
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	
	//	getConnection() 이 이제는 필요가 없다 
	
	
	//	void close()
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {}
	}
	
	
	//	BugsDTO mapping(ResultSet rs)
	private BugsDTO mapping(ResultSet rs) throws SQLException {
		BugsDTO dto = new BugsDTO();
		
		dto.setId(rs.getInt("id"));
		dto.setArtist_name(rs.getString("artist_name"));
		dto.setArtist_img(rs.getString("artist_img"));
		dto.setAlbum_name(rs.getString("album_name"));
		dto.setAlbum_img(rs.getString("album_img"));
		dto.setName(rs.getString("name"));
		dto.setGenre(rs.getString("genre"));
		dto.setPlayTime(rs.getInt("playTime"));
		dto.setLyrics(rs.getString("lyrics"));
		dto.setIsTitle(rs.getInt("isTitle"));
	
		return dto;
	}
	
	
	
	
	//	외부 공개함수
	//	conn = ds.getConnection() 로 변경 !! 
	//	ds 가 알아서 connection 을 관리하기 때문에 
	//	ds 를 호출하면 커넥션 객체가 실행 
	//	(ds 는 프로젝트 실행과 동시에 커넥션 객체 20개를 만든다 : 이건 우리가 설정한 개수임. 변경가능)
	public List<BugsDTO> selectAll(String search) {
		ArrayList<BugsDTO> list = new ArrayList<>();
		String sql = "select * from bugs"
				+ "  where"
				+ "	 name like '%' || ? || '%'" 
				+ "  or"
				+ "	 artist_name like '%' || ? || '%'"
				+ "  order by artist_name, id";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs));
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
//			System.out.println("불러온 목록의 개수 : " + list.size());
			return list;
	}
	
	
}
