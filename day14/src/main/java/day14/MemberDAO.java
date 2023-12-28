package day14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//	META-INF :	context.xml
//	WEB-INF	 :  web.xml

	
/*		DAO는 DB에 접속하기 위해 Connection 이 필요함 
 * 		Connection 을 미리 생성하여 관리하는 DataSource 객체는 context.xml 에 정의되어 있음
 * 		
 * 		1)	new InitialContext()	: context.xml 의 내용을 자바 객체로 불러옴
 * 		2) 	"jdbc/oracle"			: context.xml 에 작성한 DataSoure 객체를 지정한 이름으로 불러옴
 * 		3) 	"java:comp/env/"		: context.xml 에 정의한 객체는 접두사를 붙여야함
 * 		4) 	다운 캐스팅				: object 타입을 반환하기 때문에 다운캐스팅 (그 이후에는 예외처리)
 * 
 * 
 */
	
	public class MemberDAO {
		
		
		//	jdbc:oracle:thin ...
		private Context init;
		private DataSource ds;
		
		
		//	연결, 상태, 결과 객체 
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		
		//	싱글톤	:  MemberDAO 의 객체는 오직 하나 뿐이다
		//			   getInstance() 는 외부에서 호출 가능 
		private static MemberDAO instance = new MemberDAO();
		
		public static MemberDAO getInstance() {
			return instance;
		}
		
		
		//	생성자	:  외부에서 호출할 수 없도록 private 
		private MemberDAO() {
			try {
				init = new InitialContext();	//	context.xml 을 불러옴
				ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");		//	context 내부에 있는 DataSource 불러옴
			
			} catch (NamingException e) {
				e.printStackTrace();
			}
			
		}
		
		private MemberDTO mapping(ResultSet rs) throws SQLException {
			MemberDTO dto = new MemberDTO();
			
			dto.setUserid(rs.getString("userid"));
			dto.setUserpw(rs.getString("userpw"));
			dto.setUsername(rs.getString("username"));
			dto.setGender(rs.getString("gender"));
			dto.setEmail(rs.getString("email"));
			
			return dto;
			
		}
		
		
		private void close() {
			
			try {
				if(rs != null)		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null)	conn.close();
			} catch (Exception e) {}
		}
		
		
		
		//	DB버전정보 확인 (= 접속 성공여부 확인하기 위한 용도)
		public String getVersion() {
			String version = null;
			String sql = "select banner from v$version";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					version = rs.getString("banner");
				}
			} catch (Exception e) {
				e.printStackTrace();
				version = e.getMessage();
			}
			finally {
				close();
			}
			
			return version;
		}
		
		
		
		//	목록 
		public List<MemberDTO> selectList() {
			ArrayList<MemberDTO> list = new ArrayList<>();
			String sql = "select * from member order by userid";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberDTO dto = mapping(rs);
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return list;
		}
		
		public int insert(MemberDTO dto) {
			int row = 0;
			String sql = "insert into member values (?, ?, ?, ?, ?)";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getUserid());
				pstmt.setString(2, dto.getUserpw());
				pstmt.setString(3, dto.getUsername());
				pstmt.setString(4, dto.getGender());
				pstmt.setString(5, dto.getEmail());
			
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			return row;
		}
		
		
		public int delete(String userid) {
			int row = 0;
			
			String sql = "delete from member where userid = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				row = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			return row;
			
		}
		
		public MemberDTO login(MemberDTO dto) {
			MemberDTO login = null;
			
			String sql = "select * from member where userid = ? and userpw = ?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getUserid());
				pstmt.setString(2, dto.getUserpw());
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					login = mapping(rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				close();
			}
			return login;
		}
		
}	
