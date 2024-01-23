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
		dto.setDeleted(rs.getInt("deleted"));
		
		return dto;
	}
	
	
	//	게시글 목록 불러오기
	public List<BoardDTO> selectList(String search, Paging paging) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		String sql = "select * from board2 "
				+ " where "
				+ "		   deleted = 0 and"
				+ "        (title like '%' || ? || '%' or "
				+ "        writer like '%' || ? || '%' or "
				+ "        content like '%' || ? || '%')  "
				+ " order by idx desc"
				
				+ " offset ? rows"
				+ " fetch next ? rows only";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			
			pstmt.setInt(4, paging.getOffset());	//	페이징
			pstmt.setInt(5, paging.getFetch());
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
	
	private String maskIPaddr(String src) {	// 아이피 주소 원본(DB에서 가져온 값)
		String dst = "";
		int dotCount = 0;
		for(int i = 0; i < src.length(); i++) {
			char ch = src.charAt(i);
			if(ch == '.') dotCount += 1;
			if(dotCount >= 2 && '0' <= ch && ch <= '9') {
				dst += '*';
			}
			else {
				dst += ch;
			}
		}
		return dst;
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
	
	
	//	 삭제(update)	: 삭제 처리하고 나서
	//					  리스트를 불러올때 deleted 값이 0 인 항목만 불러오기 
	//					  (== 진짜 삭제가 아님. deleted = 1 인 애들만 보이지 않게)   
	//					  selectList() 함수를 또 수정해야함 
	//	deleted = 1 - deleted : 업데이트 할때마다 deleted 의 값이 1 <-> 0 로 왔다갔다하기 
	public int delete(int idx) {
		int row = 0;
		
		String sql = "update board2 set "
				+ "	deleted = 1 - deleted "
				+ "	where idx = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return row;
	}
	
	
	
	//	내가 쓴 글만 볼 수 있는 list
	
	
	
	
	public List<BoardDTO> selectListByWriter(String userid) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		
		String sql = "select * from board2 "
				+ " where writer = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

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
	
	
	//	페이징
	//	게시글 개수 불러오기
	public int selectCount(String search) {
		int count = 0;
		
		String sql = "select count(*) from board2 "
				+ " where "
				+ "		   deleted = 0 and"
				+ "        (title like '%' || ? || '%' or "
				+ "        writer like '%' || ? || '%' or "
				+ "        content like '%' || ? || '%')  ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);	
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return count;
		
	}
	
	
	//	조회수 증가
	public int updateViewCount(int idx) {
		int row = 0;
		String sql = "update board2 set viewCount = viewCount + 1 where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return row;
	}	

	
	
	//	댓글 작성
	public int insertReply(ReplyDTO dto) {
		int row = 0;
		String sql = "insert into reply2 (parent_idx, reply_depth, board_idx, writer, content) "
				+	" values (? ,? ,? ,? ,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getParent_idx());
			pstmt.setInt(2, dto.getReply_depth());
			pstmt.setInt(3, dto.getBoard_idx());
			pstmt.setString(4, dto.getWriter());
			pstmt.setString(5, dto.getContent());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return row;
	}
	
	
	//	댓글 목록 불러오기
	public List<ReplyDTO> selectReplyList(int idx) {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		String sql = "select * from reply2"
				+ " where board_idx = ?"
				+ " start with parent_idx = 0"
				+ " connect by prior idx = parent_idx"
				+ " order SIBLINGS by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setBoard_idx(rs.getInt("board_idx"));
				dto.setContent(rs.getString("content"));
				dto.setIdx(rs.getInt(idx));
				dto.setParent_idx(rs.getInt("parent_idx"));
				dto.setReply_depth(rs.getInt("reply_depth"));
				dto.setWriteDate(rs.getDate("writeDate"));
				dto.setWriter(rs.getString("writer"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return list;
	}
}
