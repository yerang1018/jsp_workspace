package board;

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
				if(rs != null)		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		
		private BoardDTO mapping(ResultSet rs) throws SQLException {
			BoardDTO dto = new BoardDTO();
			dto.setContent(rs.getString("content"));
			dto.setIdx(rs.getInt("idx"));
			dto.setTitle(rs.getString("title"));
			dto.setWriteDate(rs.getDate("writeDate"));
			dto.setWriter(rs.getString("writer"));
			
			return dto;
		}
		
		
		//	게시글 목록
		//	(+) 댓글까지 같이 출력되게 만드는걸로 바꿈 
		public List<BoardDTO> selectList() {
			ArrayList<BoardDTO> list = new ArrayList<>();
			
			String sql = "select "
					+ " (select count(*) from reply where board_idx = board.idx) as replyCount,"
					+ " board.* "
					+ " from board order by idx desc";	//	최신글이 위에 노출
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO dto = mapping(rs);		//	기본 매핑
					dto.setReplyCount(rs.getInt("replyCount"));		//	댓글 개수
					list.add(dto);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			return list;
		}
		
		
		//	게시글 조회
		public BoardDTO selectOne(int idx) {
			BoardDTO dto = null;
			String sql = "select * from board where idx = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto = mapping(rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			return dto;
		}
		
		
		//	게시글 작성
		public int insert(BoardDTO dto) {
			int row = 0;
			String sql = "insert into board (title, writer, content) "
					+ " values (?, ?, ?)";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getContent());
				
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
