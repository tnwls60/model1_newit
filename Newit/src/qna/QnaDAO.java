package qna;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class QnaDAO {
	private DataSource ds;
	  private Connection conn;
	  private PreparedStatement pstmt;
	  private ResultSet rs;
	  
	  
	  
	  public QnaDAO() {
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
	  
	  
	 
	public List<QnaDTO> getBoardList(int startRow, int pageSize) {
		List<QnaDTO> qnaList = new ArrayList<QnaDTO>();
		
		try{
			conn = ds.getConnection();
			String sql = "select * from qna order by no desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				QnaDTO dto = new QnaDTO();
				dto.setNo(rs.getInt("no"));
				dto.setCategory(rs.getString("category"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getInt("password"));
				dto.setWritedate(rs.getDate("writedate"));
				qnaList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return qnaList; 
	} 

	
	public void insertBoard(QnaDTO dto) {
		try{
			conn = ds.getConnection();
			
			
			String sql = "insert into qna (category, content, id, password, writedate)"
					+" values(?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setInt(4, dto.getPassword());
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	}

	
	
	public QnaDTO getBoard(int no) { 
		
		QnaDTO dto = new QnaDTO();
		
		try{
			conn = ds.getConnection();
			String sql = "select * from qna where no = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setNo(no);
			dto.setCategory(rs.getString("category"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setPassword(rs.getInt("password"));
	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}		
		return dto;
	}
	
	
	public int passCheck(int no, int password) { 
		
		int chkPass = 0; 
		
		try{
			conn = ds.getConnection();
			String sql = "select * from qna where no = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getInt("password") == password) {
					chkPass = 1;
					}else{
					chkPass = 0;
					}
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}		
		return chkPass;
	}

	
	
	
	 public void modifyBoard(QnaDTO dto) {
	    try {
	      conn = ds.getConnection();
	      String sql = "update qna set content=? WHERE no=?";
	      
	      pstmt = conn.prepareStatement(sql);
	      
	      pstmt.setString(1, dto.getContent());
	      pstmt.setInt(2, dto.getNo());
	      
	      pstmt.executeUpdate();
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      close();
	    } 
	  }
	 
	 public int getBoardCount() {
			int count = 0;
			try{
				conn = ds.getConnection();
				String sql = "select count(*) from qna";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next())
					count = (rs.getInt(1));
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				close();
			}
			return count;
		}
	
	public void deleteBoard(int no) {
		try{
			conn = ds.getConnection();
			String sql = "delete from qna where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			sql = "delete from comment where qna_no = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	}
	
}

