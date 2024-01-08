package board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			
		} catch (Exception e) {}
	}
	
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setContent(rs.getString("content"));
		dto.setImage(rs.getString("image"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setWriteDate(rs.getDate("writeDate"));
		
		return dto;
	}
	
	
	//	게시글 목록 불러오기
	public List<BoardDTO> selectList(String search) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		String sql = "select * from board2 "
				+ " where "
				+ "        title like '%' || ? || '%' or "
				+ "        writer like '%' || ? || '%' or "
				+ "        content like '%' || ? || '%'		"
				+ " order by idx desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list;
		
	}
	
	
	//	게시글 조회 1개 (ip 주소를 일부 가리기)
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		
		String sql = "select * from board2 where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
				dto.setIpaddr(maskIPaddr(dto.getIpaddr()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return dto;
	}
	
	private String maskIPaddr(String src) {		//	ip 주소 원본(DB에서 가져온 값)
		String dst = "";	
		
		dst = src.replace(src.substring(8,14), "***.**");
		
		return dst;			//	뒷자리 숫자를 자릿수 맞춰서 *로 바꾼 문자열 
	}
	
	//	게시글 작성
	public int insert(BoardDTO dto) {
		int row = 0;
		
		String sql = "insert into board2 (title, writer, content, image, ipaddr) "
				+ "  values (?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImage());
			pstmt.setString(5, dto.getIpaddr());
			
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return row;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
