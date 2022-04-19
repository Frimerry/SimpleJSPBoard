package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection con = null;
		Context initContext = new InitialContext();
		Context envContent = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContent.lookup("jdbc/myoracle");
		con = ds.getConnection();
		return con;
		}
	
	// 입력한 id와 비밀번호 확인
	public int userCheck(String userid, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;

		String sql = "select userid, pwd from member where userid=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)){
					// 비번 일치하면 1리턴
					result = 1;
				}else {
					// 비번 불일치하면 0리턴
					return 0;
				}
			}else {
				// id 없으면 -1 리턴
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	// 로그인 후 회원정보
	public MemberVO getUser(String userid) {
		MemberVO mVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from member where userid=?";

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mVO = new MemberVO();
				mVO.setName(rs.getString("name"));
				mVO.setUserid(rs.getString("userid"));
				mVO.setPwd(rs.getString("pwd"));
				mVO.setEmail(rs.getString("email"));
				mVO.setPhone(rs.getString("phone"));
				mVO.setAdmin(rs.getInt("admin"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return mVO;
	}
	
	public int confirmID(String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;

		String sql = "select pwd from member where userid=?";

		try {
			conn = getConnection(); // DB 연결 시도
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = 1;
			} else {
				result = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	    
	    public int insertMember(MemberVO mVo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			int result = -1;

			String sql = "insert into member values(?, ?, ?, ?, ?, ?)";

			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mVo.getName());
				pstmt.setString(2, mVo.getUserid());
				pstmt.setString(3, mVo.getPwd());
				pstmt.setString(4, mVo.getEmail());
				pstmt.setString(5, mVo.getPhone());
				pstmt.setInt(6, mVo.getAdmin());

				result = pstmt.executeUpdate(); // insert가 성공한 행의 수를 반환
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (pstmt != null) {
						pstmt.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return result;
		}
	
	    public int updateMember(MemberVO mVo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			int result = -1;

			String sql = "update member set pwd = ?, email = ?, phone = ?, admin = ? where userid = ?";

			try {
				con = getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, mVo.getPwd());
				pstmt.setString(2, mVo.getEmail());
				pstmt.setString(3, mVo.getPhone());
				pstmt.setInt(4, mVo.getAdmin());
				pstmt.setString(5, mVo.getUserid());

				result = pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			return result;
		}
	
	
}