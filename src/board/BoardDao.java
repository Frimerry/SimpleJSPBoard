package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	public BoardDao() {}
	
	public Connection getConnection() throws Exception{
		Connection con = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		con = ds.getConnection();
		return con;
	}
	
	// 글 작성
	public int insert(BoardVo vo) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into BOARD (\"NUM\", \"TITLE\", \"WRITER\",\"CONTENT\",\"REGDATE\",\"CNT\")"
						+"values(\"BOARD_SEQ\".nextval,?,?,?,sysdate,0)";
		int ret = -1;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			ret = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con !=null)
					con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ret;
	}
	
	// 글 여러개 조회
	public List<BoardVo> selectAll(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\","
				+ "\"REGDATE\",\"CNT\" from \"BOARD\" order by \"NUM\" desc";
		ArrayList<BoardVo> ls = new ArrayList<>();
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				BoardVo vo = new BoardVo(
						// BoardVo 생성자
						rs.getInt(1), rs.getString(2),
						rs.getString(3),rs.getString(4),
						new Date(rs.getDate(5).getTime()),rs.getInt(6)
						);
				ls.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(stmt!=null)
				try {
					stmt.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return ls;
	}
	
	// 하나 조회
	public BoardVo selectOne(int num) {
		// 사용자가 클릭한 num parameter의 글 조회
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String query="select \"NUM\",\"TITLE\",\"WRITER\",\"CONTENT\","
				+ "\"REGDATE\",\"CNT\" from \"BOARD\" where \"NUM\"=?";
		BoardVo vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			updateCnt(num); // 조회수 +1
			rs=pstmt.executeQuery();
			if(rs.next()) {
				vo = new BoardVo(rs.getInt(1), rs.getString(2),
						rs.getString(3),rs.getString(4),
						new Date(rs.getDate(5).getTime()),rs.getInt(6));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con !=null)
					con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(rs !=null)
					rs.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	// 조회수 count
	public int updateCnt(int num) {
		// 클릭한 게시글 num를 받아옴
		Connection con = null;
		PreparedStatement pstmt =null;
		String query="UPDATE \"BOARD\" SET \"CNT\"=\"CNT\"+1 WHERE \"NUM\"=?";
		int result = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con !=null)
					con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 수정
	public int update(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"BOARD\" set \"TITLE\"=?, \"CONTENT\"=?"+"where \"NUM\"=?";
		int ret=-1;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
			ret = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con !=null)
					con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ret;
	}
	
	public int delete(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "delete from \"BOARD\" where \"NUM\"=? ";
		int ret=-1;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con !=null)
					con.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ret;
	}
	
}
