package qna;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import qna.CommentDTO;


public class CommentDAO {
	private DataSource ds;
	  private Connection conn;
	  private PreparedStatement pstmt;
	  private ResultSet rs;
	  
	  
	  
	  public CommentDAO() {
	    try {
	      Context ctx = new InitialContext();
	      ds = (DataSource)ctx.lookup("java:comp/env/jdbc/new_pjt");
	    } catch (Exception e) {
	      e.printStackTrace();
	    } 
	  }

	  
	  /*자원해제 메소드*/  
	  public void close() {
	    try {
	      if (conn != null) conn.close(); 
	      if (pstmt != null) pstmt.close(); 
	      if (rs != null) rs.close(); 
	    } catch (Exception e) {
	      e.printStackTrace();
	    } 
	  }
	  

		public void insertComment(CommentDTO dto) {
			try {
				conn = ds.getConnection();
				String sql = "insert into comment(id, comment, qna_no, date) values(?,?,?,now())";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getComment());
				pstmt.setInt(3, dto.getQna_no());

				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}

		public void deleteComment(int no) {
			try {
				conn = ds.getConnection();
				String sql = "delete from comment where no=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
		}
		}

		public int getCommentCount(int contentNum) {
			int count = 0;

			try {
				conn = ds.getConnection();
				String sql = "select count(*) from comment where qna_no=?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, contentNum);

				rs = pstmt.executeQuery();

				if (rs.next())
					count = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return count;
		}

		public List<CommentDTO> getCommentList(int no) {
			List<CommentDTO> list = new ArrayList<CommentDTO>();

			try {
				conn = ds.getConnection();
				String sql;
				sql = "select * from comment where qna_no=? order by date desc";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					CommentDTO dto = new CommentDTO();

					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setComment(rs.getString("comment"));
					dto.setDate(rs.getDate("date"));

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

