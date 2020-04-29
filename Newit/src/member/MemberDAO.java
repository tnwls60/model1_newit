package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

/*import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;*/
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class MemberDAO
{
  private DataSource ds;
  private Connection conn;
  private PreparedStatement pstmt;
  private ResultSet rs;
  
  public MemberDAO() {
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

  public boolean duplId(String id) {
		boolean check = true;
		try {
			conn = ds.getConnection();
			String sql = "SELECT id FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return check;
	}
 
  
	
  public void addMember(MemberDTO dto) {
    try {
      conn = ds.getConnection();
      String sql = "insert into member values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getId());
      pstmt.setString(2, dto.getPassword());
      pstmt.setString(3, dto.getName());
      pstmt.setString(4, dto.getEmail());
      pstmt.setInt(5, dto.getZipcode());
      pstmt.setString(6, dto.getAddress1());
      pstmt.setString(7, dto.getAddress2());
      
      pstmt.executeUpdate();
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      close();
    } 
  }

  
  public int checkMember(String id, String password) {
    int chkLogin = 0;
    try {
      conn = ds.getConnection();
      String sql = "select * from member where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      
      if (!rs.next()) {
        chkLogin = 0;
      } else if (rs.getString("password").equals(password)) {
        chkLogin = 1;
      } else {
        chkLogin = -1;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      close();
    } 
    
    return chkLogin;
  }

  
  public void modifyMember(MemberDTO dto) {
    try {
      conn = ds.getConnection();
      String sql = "update member set password=?, email=?, zipcode=?, address1=?, address2=? WHERE id=?";
      
      pstmt = conn.prepareStatement(sql);
      
      pstmt.setString(1, dto.getPassword());
      pstmt.setString(2, dto.getEmail());
      pstmt.setInt(3, dto.getZipcode());
      pstmt.setString(4, dto.getAddress1());
      pstmt.setString(5, dto.getAddress2());
      pstmt.setString(6, dto.getId());
      
      pstmt.executeUpdate();
    }
    catch (Exception e) {
      e.printStackTrace();
    } finally {
      close();
    } 
  }

  
  public MemberDTO callMemInfo(String id) {
    MemberDTO dto = new MemberDTO();
    try {
      conn = ds.getConnection();
      
      String sql = "select * from member WHERE id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      rs = pstmt.executeQuery();
      
      while (rs.next()) {
        dto.setEmail(rs.getString("email"));
        dto.setName(rs.getString("name"));
        dto.setPassword(rs.getString("password"));
        dto.setZipcode(rs.getInt("zipcode"));
        dto.setAddress1(rs.getString("address1"));
        dto.setAddress2(rs.getString("address2"));
      } 
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      close();
    } 
    return dto;
  }
  
  public int checkDrop(String id, String password) {
	  int chkDrop = 0;
		try {
			conn = ds.getConnection();
			String sql = "select * from member where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				//비밀번호 맞으면
				chkDrop = 1;
			}else{
				//비밀번호가 틀리면
				chkDrop = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return chkDrop;
  }
  
  public void dropMember(String id, String password) {
	try{  
		conn = ds.getConnection();
		String sql = "delete from member where id=? and password=?"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.executeUpdate();
  	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		close();
	}
	
}
  
  
}