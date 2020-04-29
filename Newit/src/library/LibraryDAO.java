package library;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


public class LibraryDAO {
	private DataSource ds;
	  private Connection conn;
	  private PreparedStatement pstmt;
	  private ResultSet rs;
	  
	  
	  
	  public LibraryDAO() {
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
	  
	  
	 
	public List<LibraryDTO> getBoardList(int startRow, int pageSize, String search_op,	String search_key) {
		
		List<LibraryDTO> libraryList = new ArrayList<LibraryDTO>();
		try{
			conn = ds.getConnection();
			String sql;
			if (search_key == null) {
			conn = ds.getConnection();
				sql = "select * from library order by no desc limit ?, ?";
			}else{
				sql = "select * from library where " + search_op + " like '%" + search_key + "%' order by no desc limit ?, ?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				LibraryDTO dto = new LibraryDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setOriginalfile(rs.getString("originalfile"));
				dto.setSavefile(rs.getString("savefile"));
				dto.setWritedate(rs.getDate("writedate"));
				libraryList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		return libraryList; 
	} 

	
	public void insertBoard(LibraryDTO dto) {
		try{
			conn = ds.getConnection();
			
			
			String sql = "insert into library(title, content, id, readcount, originalfile, savefile, writedate)"
					+" values(?,?,?,0,?,?,now())";
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getOriginalfile());
			pstmt.setString(5, dto.getSavefile());
			pstmt.executeUpdate();
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
	}

	
	
	public LibraryDTO getBoard(int no) { 
		
		LibraryDTO dto = new LibraryDTO();
		
		try{
			conn = ds.getConnection();
			String sql = "update library set readcount = readcount + 1 where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no); 
			pstmt.executeUpdate();
			
			sql = "select * from library where no = ?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setNo(no);
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setOriginalfile(rs.getString("originalfile"));
			dto.setSavefile(rs.getString("savefile"));
			dto.setReadcount(rs.getInt("readcount"));
	
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}		
		return dto;
	}


	public void deleteBoard(int no) {
		try{
			conn = ds.getConnection();
			String sql = "delete from library where no = ?";
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
	

	public int getBoardCount() {
		int count = 0;
		try{
			conn = ds.getConnection();
			String sql = "select count(*) from library";
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
	
	
	
}

