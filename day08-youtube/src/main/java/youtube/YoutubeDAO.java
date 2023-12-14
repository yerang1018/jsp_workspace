package youtube;

import java.sql.*;
import java.util.*;
import oracle.jdbc.driver.OracleDriver;




//	IDX			NUMBER
//	TITLE		VARCHAR2(100 BYTE)
//	CATEGORY	VARCHAR2(50 BYTE) 	check ('음악','반려동물')
//	NAME		VARCHAR2(100 BYTE)
//	IMGNAME		VARCHAR2(1000 BYTE)
//	TAG			VARCHAR2(2000 BYTE)

public class YoutubeDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	//	getConnection()
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		return DriverManager.getConnection(url, user, password);
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
	}
	
	//	mapping
	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setCategory(rs.getString("category"));
		dto.setName(rs.getString("name"));
		dto.setImgname(rs.getString("imgname"));
		dto.setTag(rs.getString("tag"));
		
		return dto;
	}
	
	
	//	전체목록 (select * from youtube)
	public List<YoutubeDTO> selectList() {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
			
	}
	
	
	//	카테고리 별 목록 (select * from youtube where category = ?)
	public List<YoutubeDTO> selectListByCategory(String category) {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube where category = ? ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//	단일 조회 (select * from youtube where idx = ?)
	public YoutubeDTO selectOne(int idx) {
		String sql = "select * from youtube where idx = ?";
		
		YoutubeDTO dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, idx);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	
	//	추가  insert into youtube (title, category, name, imgname, tag) values (?,?,?,?,?)
	public int insert(YoutubeDTO dto) {
		int row = 0;
		String sql = "insert into youtube (title, category, name, imgname, tag) values (? ,? ,? ,? ,?) ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getImgname());
			pstmt.setString(5, dto.getTag());
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	
	//	마지막 사용한 시퀀스 번호 불러오는 함수
	//	select max(idx) from youtube
	
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from youtube";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idx;
	}
	
	
	//	삭제 (delete youtube where idx=?
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete youtube where idx= ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
