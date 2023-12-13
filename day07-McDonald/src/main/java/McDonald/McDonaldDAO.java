package McDonald;

//	CRUD 기능을 함수로 작성
//	작성이 끝나면 싱글톤 적용

import java.sql.*;
import java.util.*;
import oracle.jdbc.driver.OracleDriver;

public class McDonaldDAO {

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
	
	
	//	close()
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)   pstmt.close();
			if(conn != null)    conn.close();
		} catch(SQLException e) {}
	}
	
	
	//	mapping
	private McDonaldDTO mapping(ResultSet rs) throws SQLException {
		McDonaldDTO dto = new McDonaldDTO();
		dto.setCategory(rs.getString("category"));
		dto.setIdx(rs.getInt("idx"));
		dto.setImgName(rs.getString("imgName"));
		dto.setMemo(rs.getString("memo"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		return dto;
	}
	
	
	//	전체 목록 (select * from mcdonald) = public
	public List<McDonaldDTO> selectList() {
		ArrayList<McDonaldDTO> list = new ArrayList<>();
		String sql = "select * from mcdonald";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close();} 
		return list;
	}
	
	
	//	카테고리 별 목록 (select * from mcdonald where category = ?)
	public List<McDonaldDTO> selectListByCategory(String category) {
		ArrayList<McDonaldDTO> list = new ArrayList<>();
		String sql = "select * from mcdonald where category = ?";
		
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
		} finally { close();} 
		return list;
	}
	
	
	//	단일 조회 (select * from mcdonald where idx = ?)
	public McDonaldDTO selectOne(int idx) {		//	단일 객체 반환이니까 list 대신 dto 객체
		String sql = "select * from mcdonald where idx = ?";
		
		McDonaldDTO dto = null;
		
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
		} finally { close();} 
		
		return dto;
	}
	
	//	추가 (insert into mcdonald (category, name, price, imgName, memo) values (?, ?, ?, ?, ?)
	public int insert(McDonaldDTO dto) {
		int row = 0;
		String sql = "insert into mcdonald (category, name, price, imgName, memo) values (?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgName());
			pstmt.setString(5, dto.getMemo());
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	
	//	마지막으로 사용한 시퀀스 번호를 불러오는 함수
	//	select max(idx) from mcdonald
	
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from mcdonald";
		
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
	
	
	
	//	삭제	(delete mcdonald where idx = ?)
	public int delete(int idx) {
		int row = 0;
		String sql = "delete mcdonald where idx = ?";
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
	
	
	//	수정 
	public int update(McDonaldDTO dto) {
		int row = 0;
		String sql = "update mcdonald set name = ?, price = ?, imgname = ?, category = ?, memo = ? where idx = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getImgName());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getMemo());
			pstmt.setInt(6, dto.getIdx());
			
			row = pstmt.executeUpdate();
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		} 
		return row;
	}
	
	
}
